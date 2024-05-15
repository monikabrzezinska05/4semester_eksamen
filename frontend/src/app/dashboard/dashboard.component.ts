import {Component, OnInit} from '@angular/core';
import {OverviewComponent} from "../overview/overview.component";
import {SidebarComponent} from "../sidebar/sidebar.component";
import {UnitType} from "../../models/Unit";

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

    protected readonly UnitType = UnitType;
}
