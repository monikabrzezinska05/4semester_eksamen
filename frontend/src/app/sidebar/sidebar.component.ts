import {Component, OnInit, ViewChild, ElementRef, Renderer2, AfterViewInit} from '@angular/core';
import {FormBuilder, Validators} from "@angular/forms";
import {State} from "../../services/state.service";
import {ServerDeAuthenticatesUserDto} from "../../models/BaseDto";
import {Router} from "@angular/router";

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.css'
})
export class SidebarComponent implements OnInit, AfterViewInit {
  @ViewChild('toggleSwitch') toggleSwitch!: ElementRef;
  @ViewChild('toggleDarkmode') toggleDarkmodeSwitch!: ElementRef;
  private modal!: HTMLElement;
  private modalContent!: HTMLElement;
  darkMode = false;

  constructor(private renderer: Renderer2,
              private state: State,
              private formBuilder: FormBuilder,
              private router: Router) {
  }

  ngOnInit(): void {
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
    this.modalContent = document.getElementById("settingsModalContent")!;
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

  onOutsideModalPressed() {
    window.onclick = (event: MouseEvent) => {
      if (event.target === this.modal) {
        this.modal.style.display = "none";
      }
    }
  }
}
