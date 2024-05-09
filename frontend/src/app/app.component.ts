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
    if(this.state.currentUser == null && !this.isLoginRoute()) {
      this.router.navigateByUrl('/login');
    }
  }

  private isLoginRoute() {
    return this.router.url.includes('login');
  }
}
