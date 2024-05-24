import {Component, OnInit, ViewChild, ElementRef, Renderer2, AfterViewInit} from '@angular/core';
import {FormBuilder, Validators} from "@angular/forms";
import {State} from "../../services/state.service";
import {ServerDeAuthenticatesUserDto} from "../../models/BaseDto";
import {Router} from "@angular/router";
import {map, Observable} from "rxjs";
import {EmailModel} from "../../models/EmailModel";

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.css'
})
export class SidebarComponent implements OnInit, AfterViewInit {
  @ViewChild('toggleSwitch') toggleSwitch!: ElementRef;
  @ViewChild('toggleDarkmode') toggleDarkmodeSwitch!: ElementRef;
  private modal!: HTMLElement;
  Email$!: Observable<EmailModel[]>;
  darkMode = false;

  constructor(private renderer: Renderer2,
              private state: State,
              private formBuilder: FormBuilder,
              private router: Router) {
  }

  readonly addEmail = this.formBuilder.group({
    Email: ['', [Validators.required, Validators.email]],
  })

  readonly createUser = this.formBuilder.group({
    Name: ['', [Validators.required]],
    Email: ['', [Validators.required, Validators.email]],
    Password: ['', [Validators.required, Validators.minLength(6)]],
    ConfirmPassword: ['', [Validators.required, Validators.minLength(6)]],
    IsChild: [false, Validators.required],
  })

  ngOnInit(): void {
    this.Email$ = this.getEmailObservable();
  }

  ngAfterViewInit(): void {
    setTimeout(() => {
      this.renderer.listen(this.toggleSwitch.nativeElement, 'click', (event) => {
        const knob = this.toggleSwitch.nativeElement.querySelector('.toggle-knob') as HTMLElement;
        if (knob.style.left === '55px') {
          // KALD HER METODE DER SKAL DEAKTIVERE NOGET!!!!
          knob.style.left = '5px';
          knob.style.backgroundColor = '#ff0000';
        } else {
          // KALD HER METODE DER SKAL AKTIVERE NOGET!!!!
          knob.style.left = '55px';
          knob.style.backgroundColor = '#08ff00';
        }
      });

      //til modal
      this.renderer.listen(this.toggleDarkmodeSwitch.nativeElement, 'click', (event) => {
        const knob = this.toggleDarkmodeSwitch.nativeElement.querySelector('.toggle-knob') as HTMLElement;
        const knobIcon = this.toggleDarkmodeSwitch.nativeElement.querySelector('.knob-icon') as HTMLElement;
        var sun = '&#9728;';
        var moon = '&#9789';
        if (knob.style.left === '55px') {
          // KALD HER METODE DER SKAL DEAKTIVERE NOGET!!!!
          this.toggleDarkmode();
          knob.style.left = '5px';
          knobIcon.innerHTML = sun;
        } else {
          // KALD HER METODE DER SKAL AKTIVERE NOGET!!!!
          this.toggleDarkmode();
          knob.style.left = '55px';
          knobIcon.innerHTML = moon;
        }
      });
    }, 0);
    this.modal = document.getElementById("settingsModal")!;
  }

  private getEmailObservable(): Observable<EmailModel[]> {
    return this.state.getAllEmails().pipe(
      map(emailItems => emailItems.map(item => (
        console.log("email: "+item),
        {
          ...item
        }
      )))
    );
  }

  Logoff() {
    console.log('Logoff method has been called');
    var dto = {
      eventType: "ClientWantsToDeAuthenticate"
    }
    this.state.ws.send(JSON.stringify(dto));
  }

  onSettingsButtonPressed() {
    this.modal.style.display = "block";
  }

  onModalClosePressed() {
    this.modal.style.display = "none";
  }

  onOutsideModalPressed() {
    window.onclick = (event: MouseEvent) => {
      if (event.target === this.modal) {
        this.modal.style.display = "none";
      }
    }
  }

  toggleDarkmode() {
    this.darkMode = !this.darkMode;
    if (this.darkMode) {
      this.renderer.addClass(document.body, 'dark-mode');
    } else {
      this.renderer.removeClass(document.body, 'dark-mode');
    }
  }

  onHistoryButtonPress() {
    if (this.router.url !== '/history') {
      this.router.navigateByUrl('/history');
    }
  }

  onDashboardButtonPressed() {
    if (this.router.url !== '') {
      this.router.navigateByUrl('');
    }
  }

  onAddEmailPressed() {
    if (this.addEmail.valid){
      var dto = {
        eventType: "ClientWantsToCreateEmail",
        Email: this.addEmail.value.Email
      }
      this.state.ws.send(JSON.stringify(dto));
    }
  }

  onDeleteEmailPressed(id: number) {
    var dto = {
      eventType: "ClientWantsToDeleteEmail",
      emailid: id
    }
    this.state.ws.send(JSON.stringify(dto));
  }

  onCreateUserPressed() {
    if (this.createUser.value.Password == this.createUser.value.ConfirmPassword && this.createUser.valid) {
      var dto = {
        eventType: "ClientWantsToCreateUser",
        userModel: {
          name: this.createUser.value.Name,
          mail: this.createUser.value.Email,
          isChild: this.createUser.value.IsChild
        },
        password: this.createUser.value.Password
      }
      console.log("user: " + dto);
      this.state.ws.send(JSON.stringify(dto));
    }
  }
}
