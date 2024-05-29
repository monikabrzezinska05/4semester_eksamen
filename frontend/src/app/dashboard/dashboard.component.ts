import {AfterViewInit, Component, OnInit} from '@angular/core';
import {OverviewComponent} from "../overview/overview.component";
import {SidebarComponent} from "../sidebar/sidebar.component";
import {UnitType} from "../../models/Unit";
import {ToastrService} from "ngx-toastr";

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.css'
})
export class DashboardComponent implements AfterViewInit{
  sidebarOpen = true;
  protected readonly UnitType = UnitType;

  constructor(private toastr: ToastrService) { }

  ngAfterViewInit() {
    this.toastr.success("Welcome back to the dashboard!");
  }

  toggleSidebar() {
    this.sidebarOpen = !this.sidebarOpen;
    let sidebar = document.querySelector('.sidebar');
    if (this.sidebarOpen) {
      sidebar!.classList.add('open');
    } else {
      sidebar!.classList.remove('open');
    }
  }
}
