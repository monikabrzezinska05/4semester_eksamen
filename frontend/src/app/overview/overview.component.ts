import {Component, Input, OnInit} from '@angular/core';
import {CommonModule} from "@angular/common";
import {Unit, UnitType} from "../../models/Unit";
import {State} from "../../services/state.service";
import {NgArrayPipesModule} from "ngx-pipes";
import {Observable} from "rxjs";

@Component({
  selector: 'app-overview',
  standalone: true,
  imports: [CommonModule, NgArrayPipesModule],
  templateUrl: './overview.component.html',
  styleUrl: './overview.component.css'
})

export class OverviewComponent implements OnInit {
  @Input() unitType!: number;
  units$?: Observable<Unit[]>;

  constructor(public state: State) {
    var dto = {
      eventType: "ClientWantsToSeeUnits"
    }
    this.state.ws.send(JSON.stringify(dto))
  }

  ngOnInit(): void {
    this.units$ = this.getUnitsObservable(this.unitType);
  }

  private getUnitsObservable(unitType: UnitType): Observable<Unit[]> {
    if (unitType === UnitType.Door) {
      return this.state.getDoors();
    }

    if (unitType === UnitType.Window) {
      return this.state.getWindows();
    }

    if (unitType === UnitType.MotionSensor) {
      return this.state.getMotionSensor();
    }

    throw new Error(`Unknown unit type: ${unitType}`);
  }
}
