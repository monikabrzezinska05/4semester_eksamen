import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import {SidebarComponent} from "./sidebar/sidebar.component";
import {OverviewComponent} from "./overview/overview.component";
import {LoginpageComponent} from "./loginpage/loginpage.component";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, SidebarComponent, OverviewComponent, LoginpageComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {

}
