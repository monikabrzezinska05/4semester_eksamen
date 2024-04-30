import { Component } from '@angular/core';
import {CommonModule} from "@angular/common";
import {FormBuilder, ReactiveFormsModule, Validators} from "@angular/forms";
import {HttpClientModule} from "@angular/common/http";

@Component({
  selector: 'app-loginpage',
  imports: [CommonModule, ReactiveFormsModule, HttpClientModule],
  templateUrl: './loginpage.component.html',
  styleUrls: ['./loginpage.component.css'],
  standalone: true
})

export class LoginpageComponent {

  constructor(public http: HttpClientModule,
              private readonly formBuilder: FormBuilder){}

  readonly login = this.formBuilder.group({
    Email: ['', [Validators.required, Validators.email]],
    Password: ['', Validators.required],
    RememberMe: [false]
  });

  async submit() {
    const url = 'http://localhost:4200'; //ændre at some point

  }
}
