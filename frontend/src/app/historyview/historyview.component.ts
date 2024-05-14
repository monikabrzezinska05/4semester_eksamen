import {Component, OnInit} from '@angular/core';
import {AsyncPipe, NgForOf} from "@angular/common";
import { HistoryModel } from "../../models/HistoryModel";
import { Observable } from "rxjs";
import {State} from "../../services/state.service";

@Component({
  selector: 'app-historyview',
  standalone: true,
  imports: [
    NgForOf,
    AsyncPipe
  ],
  templateUrl: './historyview.component.html',
  styleUrl: './historyview.component.css'
})
export class HistoryviewComponent implements OnInit{
  History$!: Observable<HistoryModel[]>;

  constructor(private state: State) {}

  ngOnInit(): void {
    this.History$ = this.getHistoryObservable();
  }

  private getHistoryObservable(): Observable<HistoryModel[]> {
    return this.state.getAllHistory();
  }
}
