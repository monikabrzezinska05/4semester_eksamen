import {Component, OnInit} from '@angular/core';
import {OverviewComponent} from "../overview/overview.component";
import {SidebarComponent} from "../sidebar/sidebar.component";

@Component({
  selector: 'app-dashboard',
  standalone: true,
    imports: [
        OverviewComponent,
        SidebarComponent
    ],
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.css'
})
export class DashboardComponent implements OnInit {
  constructor() { }

  ngOnInit(): void {

  }

}
