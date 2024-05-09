import {Component, inject} from '@angular/core';
import {CommonModule} from "@angular/common";
import {FormBuilder, ReactiveFormsModule, Validators} from "@angular/forms";
import {Router, RouterOutlet} from "@angular/router";
import {WsClientService} from "../../ws.client.service";
import {ClientWantsToLogin} from "../../models/clientWantsToLogin";

@Component({
  selector: 'app-loginpage',
  imports: [CommonModule, ReactiveFormsModule, RouterOutlet],
  templateUrl: './loginpage.component.html',
  styleUrls: ['./loginpage.component.css'],
  standalone: true
})

export class LoginpageComponent {
  ws = inject(WsClientService);

  constructor(public readonly router: Router,
              private readonly formBuilder: FormBuilder){}

  readonly login = this.formBuilder.group({
    Email: ['', [Validators.required, Validators.email]],
    Password: ['', Validators.required],
    RememberMe: [false]
  });

 Login() {
  this.ws.socketConnection.sendDto(new ClientWantsToLogin({Password: this.login.value.Password!, Email: this.login.value.Email!}));
  }
}
