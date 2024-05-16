import { Component } from '@angular/core';
import {SidebarComponent} from "../sidebar/sidebar.component";
import {HistoryviewComponent} from "../historyview/historyview.component";

@Component({
  selector: 'app-historypage',
  standalone: true,
  imports: [
    SidebarComponent,
    HistoryviewComponent
  ],
  templateUrl: './historypage.component.html',
  styleUrl: './historypage.component.css'
})
export class HistorypageComponent {

}
