import {Component, OnInit} from '@angular/core';
import {CommonModule} from "@angular/common";
import {EventType, HistoryModel} from "../../models/HistoryModel";
import {concatWith, map, Observable} from "rxjs";
import {State} from "../../services/state.service";
import {Status} from "../../models/Unit";
import {FormControl, ReactiveFormsModule} from "@angular/forms";

@Component({
  selector: 'app-historyview',
  templateUrl: './historyview.component.html',
  styleUrl: './historyview.component.css'
})
export class HistoryviewComponent implements OnInit {
  searchControl = new FormControl('');
  AllHistory$!: Observable<HistoryModel[]>;
  ShownHistory$!: Observable<HistoryModel[]>;
  Status = Status;

  constructor(private state: State) {
  }

  ngOnInit(): void {
    this.AllHistory$! = this.getHistoryObservable();
    this.ShownHistory$! = this.AllHistory$;
    this.searchControl.valueChanges.subscribe((searchTerm) => this.searchHistory(searchTerm!))
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

  private searchHistory(searchTerm?: string) {
    if (!searchTerm) {
      this.ShownHistory$ = this.AllHistory$;
    }
    this.ShownHistory$ = this.AllHistory$.pipe(map((history) => history.filter((historyModel) => {
      const lowerCaseSearchTerm = searchTerm!.toLowerCase();
      console.log(lowerCaseSearchTerm);
      const eventTypeString = EventType[historyModel.eventType];
      const dateString = historyModel.date.getDate().toString();
      const yearString = historyModel.date.getFullYear().toString();
      console.log("year string" + yearString)
      const unitString = historyModel.unit.name;

      return eventTypeString.toLowerCase().includes(lowerCaseSearchTerm) ||
        dateString.toLowerCase().includes(lowerCaseSearchTerm) ||
        yearString.toLowerCase().includes(lowerCaseSearchTerm) ||
        unitString.toLowerCase().includes(lowerCaseSearchTerm);
    })));

  }

  protected readonly EventType = EventType;
}

