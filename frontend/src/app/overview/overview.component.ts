import {Component, Input, OnInit} from '@angular/core';
import {CommonModule} from "@angular/common";
import {Status, Unit, UnitType} from "../../models/Unit";
import {State} from "../../services/state.service";
import {NgArrayPipesModule} from "ngx-pipes";
import {map, Observable} from "rxjs";

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

  getAllStatusColor() {
    var statusYellow = this.units$?.pipe(map(units => units.filter(unit => unit.status === Status.Disarmed)));
    var statusRed = this.units$?.pipe(map(units => units.filter(unit => unit.status === Status.Triggered)));
    if (statusRed) {
      return "red";
    }
    if (statusYellow) {
      return "yellow";
    }
    return "green";
  }

  getStatusColor(Unit: Unit) {
    if (Unit.status === Status.Armed) {
      return "green";
    }
    if (Unit.status === Status.Disarmed) {
      return "yellow";
    }
    if (Unit.status === Status.Triggered) {
      return "red";
    }
    return "black";
  }
}
