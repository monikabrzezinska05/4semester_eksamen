import {AfterViewInit, Component, ElementRef, OnInit, Renderer2, ViewChild} from '@angular/core';
import {FormBuilder, Validators} from "@angular/forms";
import {State} from "../../services/state.service";
import {Router} from "@angular/router";
import {firstValueFrom, map, Observable, of} from "rxjs";
import {EmailModel} from "../../models/EmailModel";
import {ToastrService} from "ngx-toastr";
import {EventType} from "../../models/HistoryModel";
import {UnitType} from "../../models/Unit";

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.css'
})
export class SidebarComponent implements OnInit, AfterViewInit {
  @ViewChild('toggleSwitch') toggleSwitch!: ElementRef;
  @ViewChild('toggleDarkmode') toggleDarkmodeSwitch!: ElementRef;
  @ViewChild('toggleMotion') toggleMotion!: ElementRef;
  @ViewChild('settingsModal') modal!: ElementRef;
  Email$!: Observable<EmailModel[]>;
  darkMode = false;

  constructor(private renderer: Renderer2,
              private state: State,
              private formBuilder: FormBuilder,
              private router: Router,
              private toastr: ToastrService) {
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
    const knob = this.toggleSwitch.nativeElement.querySelector('.toggle-knob') as HTMLElement;
    this.state.alarmOn.subscribe((alarmOn) => {
      if (alarmOn) {
        knob.style.left = '55px';
        knob.style.backgroundColor = '#08ff00';
      } else {
        knob.style.left = '5px';
        knob.style.backgroundColor = '#ff0000';
      }
    });

    const motionKnob = this.toggleMotion.nativeElement.querySelector('.toggle-knob') as HTMLElement;
    this.state.motionAlarmOn.subscribe((alarmOn) => {
      if (alarmOn) {
        motionKnob.style.left = '55px';
        motionKnob.style.backgroundColor = '#08ff00';
      } else {
        motionKnob.style.left = '5px';
        motionKnob.style.backgroundColor = '#ff0000';
      }
    });

    setTimeout(() => {
      this.renderer.listen(this.toggleSwitch.nativeElement, 'click', (event) => {
        if (knob.style.left === '55px') {
          knob.style.left = '5px';
          knob.style.backgroundColor = '#ff0000';
          this.toggleAlarm();
        } else {
          knob.style.left = '55px';
          knob.style.backgroundColor = '#08ff00';
          this.toggleAlarm();
        }
      });

      this.renderer.listen(this.toggleMotion.nativeElement, 'click', (event) => {
        if (motionKnob.style.left === '55px') {
          motionKnob.style.left = '5px';
          motionKnob.style.backgroundColor = '#ff0000';
          this.toggleMotionAlarm();
        } else {
          motionKnob.style.left = '55px';
          motionKnob.style.backgroundColor = '#08ff00';
          this.toggleMotionAlarm();
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
  }

  private getEmailObservable(): Observable<EmailModel[]> {
    return this.state.getAllEmails().pipe(
      map(emailItems => emailItems.map(item => (
        console.log("email: " + item),
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
    if (this.modal && this.modal.nativeElement) {
      this.renderer.setStyle(this.modal.nativeElement, 'display', 'block');
    } else {
      console.error('Modal is not available yet');
    }
  }

  onModalClosePressed() {
    this.renderer.setStyle(this.modal.nativeElement, 'display', 'none');
  }

  onOutsideModalPressed() {
    window.onclick = (event: MouseEvent) => {
      if (event.target === this.modal.nativeElement) {
        this.renderer.setStyle(this.modal.nativeElement, 'display', 'none');
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
    if (this.addEmail.valid) {
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

      this.state.ws.send(JSON.stringify(dto));

      if (this.state.messageToClient == "User created") {
        this.toastr.success("User created!");
      } else {
        this.toastr.error("Username or Email is in use");
      }
    } else if (this.createUser.value.Password != this.createUser.value.ConfirmPassword) {
      this.toastr.error("Password doesn't match!");
    } else {
      this.toastr.error("Failed to create user");
    }
  }

  async toggleAlarm() {
    if (await firstValueFrom(this.state.alarmOn)) {
      var dto = {
        eventType: "ClientWantsToTurnOffAlarm",
        historyModel: {
          unitId: 0,
          personName: this.state.currentUser?.mail,
          date: new Date(Date.now()),
          eventType: EventType.AlarmDisarmed
        }
      }
      this.state.ws.send(JSON.stringify(dto));
    } else {
      var dto = {
        eventType: "ClientWantsToTurnOnAlarm",
        historyModel: {
          unitId: 0,
          personName: this.state.currentUser?.mail,
          date: new Date(Date.now()),
          eventType: EventType.AlarmArmed
        }
      }
      this.state.ws.send(JSON.stringify(dto));
    }
  }

  async toggleMotionAlarm() {
    if (await firstValueFrom(this.state.motionAlarmOn)) {
      var dto = {
        eventType: "ClientWantsToTurnOffMotionAlarm",
        historyModel: {
          unitId: 0,
          personName: this.state.currentUser?.mail,
          date: new Date(Date.now()),
          eventType: EventType.AlarmArmed
        }
      }
      this.state.ws.send(JSON.stringify(dto));
    } else {
      var dto = {
        eventType: "ClientWantsToTurnOnMotionAlarm",
        historyModel: {
          unitId: 0,
          personName: this.state.currentUser?.mail,
          date: new Date(Date.now()),
          eventType: EventType.AlarmDisarmed
        }
      }
      this.state.ws.send(JSON.stringify(dto));
    }
  }
}
