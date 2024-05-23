import {Component, OnInit} from '@angular/core';
import {CommonModule} from "@angular/common";
import {EventType, HistoryModel} from "../../models/HistoryModel";
import {combineLatest, interval, map, Observable, startWith} from "rxjs";
import {State} from "../../services/state.service";
import {Status} from "../../models/Unit";
import { FormControl, ReactiveFormsModule} from "@angular/forms";

@Component({
  selector: 'app-historyview',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule
  ],
  templateUrl: './historyview.component.html',
  styleUrl: './historyview.component.css'
})
export class HistoryviewComponent implements OnInit{
  // - Used for search "searchControl = new FormControl('');"
  History$!: Observable<HistoryModel[]>;
  Status = Status;

  constructor(private state: State) {}

  ngOnInit(): void {
    this.History$! =  this.getHistoryObservable();
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


/**
 *  // Filtering logic
 *   private filterLogs(historyItems: HistoryModel[], searchTerm: string): HistoryModel[] {
 *     if(!searchTerm){
 *       return historyItems;
 *     }
 *     const lowerCaseSearchTerm = searchTerm.toLowerCase();
 *
 *     return historyItems.filter(item => {
 *     const eventTypeString = EventType[item.eventType];
 *
 *     const dateString = item.date.toISOString();
 *
 *     const unitString = item.unit.toString();
 *
 *     return (
 *       eventTypeString.toLowerCase().includes(lowerCaseSearchTerm) ||
 *         dateString.toLowerCase().includes(lowerCaseSearchTerm) ||
 *         unitString.toLowerCase().includes(lowerCaseSearchTerm)
 *     );
 *     });
 *   }
 *
 *   //ngOnInit
 *       this.filteredHistory$ = combineLatest([
 *       this.getHistoryObservable(),
 *       this.searchControl.valueChanges.pipe(startWith(''))
 *     ]).pipe(
 *       map(([historyItems, searchTerm]) => this.filterLogs(historyItems, searchTerm!))
 *     );
 */
