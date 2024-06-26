import {AfterViewInit, Component, Input, OnInit} from '@angular/core';
import {CommonModule} from "@angular/common";
import {Status, Unit, UnitType} from "../../models/Unit";
import {State} from "../../services/state.service";
import {map, Observable, of} from "rxjs";
import {ToastrModule, ToastrService} from "ngx-toastr";


@Component({
  selector: 'app-overview',
  templateUrl: './overview.component.html',
  styleUrl: './overview.component.css'
})

export class OverviewComponent implements OnInit {
  @Input() unitType!: UnitType;
  unitTypeName!: string;
  units$?: Observable<Unit[]>;
  mainIndicatorColor$?: Observable<string>;


  constructor(public state: State) {
  }

  ngOnInit(): void {
    this.units$ = this.getUnitsObservable(this.unitType);
    this.unitTypeName = UnitType[this.unitType]
    this.checkIfMotionSensor(this.unitType);
    this.getAllStatusColor()
  }

  private checkIfMotionSensor(unitType: UnitType) {
    if (unitType === UnitType.MotionSensor) {
      this.unitTypeName = "Motion Sensors";
    }
  }

  private getUnitsObservable(unitType: UnitType): Observable<Unit[]> {
    if (unitType === UnitType.Doors) {
      return this.state.getDoors();
    }

    if (unitType === UnitType.Windows) {
      return this.state.getWindows();
    }

    if (unitType === UnitType.MotionSensor) {
      return this.state.getMotionSensor();
    }

    throw new Error(`Unknown unit type: ${unitType}`);
  }

  getAllStatusColor() {
    this.state.units$?.subscribe(units => {
      var statusYellow = units.filter(unit => unit.unitType === this.unitType && unit.status === Status.Disarmed || unit.status === Status.Open);
      var statusRed = units.filter(unit => unit.unitType === this.unitType && unit.status === Status.Triggered);
      if (statusRed.length > 0) {
        this.mainIndicatorColor$ = of("red");
      }
      else if (statusYellow.length > 0) {
        this.mainIndicatorColor$ = of("yellow");
      }
      else {
        this.mainIndicatorColor$ = of("green");
      }
    })
  }

  getStatusColor(unit: Unit) {
    if (unit.status === Status.Armed || unit.status === Status.Closed) {
      return "green";
    }
    else if (unit.status === Status.Disarmed || unit.status === Status.Open) {
      return "yellow";
    }
    else if (unit.status === Status.Triggered) {
      return "red";
    }
    return "black";
  }
}
