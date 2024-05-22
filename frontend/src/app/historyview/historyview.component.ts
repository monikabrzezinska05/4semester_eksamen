import {Component, OnInit} from '@angular/core';
import {CommonModule} from "@angular/common";
import { HistoryModel } from "../../models/HistoryModel";
import {interval, map, Observable} from "rxjs";
import {State} from "../../services/state.service";
import {Status} from "../../models/Unit";

@Component({
  selector: 'app-historyview',
  standalone: true,
  imports: [
    CommonModule
  ],
  templateUrl: './historyview.component.html',
  styleUrl: './historyview.component.css'
})
export class HistoryviewComponent implements OnInit{
  History$!: Observable<HistoryModel[]>;
  Status = Status;

  constructor(private state: State) {}

  ngOnInit(): void {
    this.History$ = this.getHistoryObservable();
  }

  private getHistoryObservable(): Observable<HistoryModel[]> {
    return this.state.getAllHistory().pipe(
      map(historyItems => historyItems.map(item => (
          {
        ...item,
            date: new Date(item.date),
          }))
        .sort((a, b) => b.date.getTime() - a.date.getTime())
      )
    );
  }

  protected readonly interval = interval;
  protected readonly Number = Number;
  protected readonly String = String;
}

