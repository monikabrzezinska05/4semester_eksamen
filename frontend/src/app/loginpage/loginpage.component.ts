import {Component, inject} from '@angular/core';
import {CommonModule} from "@angular/common";
import {FormBuilder, ReactiveFormsModule, Validators} from "@angular/forms";
import {Router, RouterOutlet} from "@angular/router";
import {WsClientService} from "../../ws.client.service";
import {ClientWantsToLogin} from "../../models/clientWantsToLogin";
import {State} from "../../services/state.service";

@Component({
  selector: 'app-loginpage',
  imports: [CommonModule, ReactiveFormsModule, RouterOutlet],
  templateUrl: './loginpage.component.html',
  styleUrls: ['./loginpage.component.css'],
  standalone: true
})

export class LoginpageComponent {

  constructor(public readonly router: Router,
              private readonly formBuilder: FormBuilder,
              private state: State) {
  }

  readonly login = this.formBuilder.group({
    Email: ['', [Validators.required, Validators.email]],
    Password: ['', Validators.required]
  });

  Login() {
    var dto =
      {
        eventType: "ClientWantsToLogin",
        UserLogin: {
          Email: this.login.value.Email,
          Password: this.login.value.Password
        }
      };
    this.state.ws.send(JSON.stringify(dto));
  }
}
