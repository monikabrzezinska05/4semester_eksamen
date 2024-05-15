import { Component } from '@angular/core';
import {Router, RouterOutlet} from '@angular/router';
import {SidebarComponent} from "./sidebar/sidebar.component";
import {OverviewComponent} from "./overview/overview.component";
import {LoginpageComponent} from "./loginpage/loginpage.component";
import {State} from "../services/state.service";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, SidebarComponent, OverviewComponent, LoginpageComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  constructor(private router: Router, private state: State) {

    this.state.ws.onopen = () => {
      console.log("currentuser: " + this.state.currentUserId);
      if (this.state.jwt !== null || this.state.currentUserId !== null) {
        this.state.AuthenticateWithJwt();
      }
      else {
        this.router.navigate(['/login']);
      }
    }
  }

  private isLoginRoute() {
    return this.router.url.includes('login');
  }
}
