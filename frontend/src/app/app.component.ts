import { Component } from '@angular/core';
import {Router, RouterOutlet} from '@angular/router';
import {SidebarComponent} from "./sidebar/sidebar.component";
import {OverviewComponent} from "./overview/overview.component";
import {LoginpageComponent} from "./loginpage/loginpage.component";
import {State} from "../services/state.service";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  constructor(private router: Router, private state: State) {

    this.state.ws.onopen = () => {
      if (this.state.jwt !== null || this.state.currentUserId !== null) {
        this.state.AuthenticateWithJwt();
      }
      else {
        this.router.navigate(['/login']);
      }
    }
  }
}
