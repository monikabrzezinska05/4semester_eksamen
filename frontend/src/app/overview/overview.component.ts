import {AfterViewInit, Component, Input, OnInit} from '@angular/core';
import {CommonModule} from "@angular/common";
import {Unit, UnitType} from "../../models/Unit";
import {State} from "../../services/state.service";
import {concatWith} from "rxjs";

@Component({
  selector: 'app-overview',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './overview.component.html',
  styleUrl: './overview.component.css'
})

export class OverviewComponent implements OnInit {
  listOfUnits: number[] = [1, 2, 3, 4];
  @Input() unitType!: number;
  units!: Unit[];

  constructor(private state: State) {}

  ngOnInit(): void {
    this.insertUnits()
  }

  insertUnits() {
    console.log(this.state.units)
    console.log("Entered insertUnits()", this.unitType)
    /*this.units = this.state.units.filter(unit => {
      debugger;
      switch (this.unitType) {
        case "Door":
          console.log("Door")
          return unit.UnitTypeId === UnitType.Door;
        case "Window":
          console.log("Window")
          return unit.UnitTypeId === UnitType.Window;
        case "Motion Sensor":
          console.log("Motion Sensor")
          return unit.UnitTypeId === UnitType.MotionSensor;
        default:
          console.log("failed")
          return false;
      }
    });*/
    //debugger;

    this.state.units.forEach(u => {
      console.log(u)
      console.log(this.unitType)
      return u.UnitTypeId == this.unitType;
    })
  }

}
