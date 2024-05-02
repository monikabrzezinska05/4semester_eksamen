import {AfterViewInit, Component, Input, OnInit} from '@angular/core';
import {CommonModule} from "@angular/common";
import {Unit, UnitType} from "../../models/Unit";
import {State} from "../../services/state.service";

@Component({
  selector: 'app-overview',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './overview.component.html',
  styleUrl: './overview.component.css'
})

export class OverviewComponent implements OnInit, AfterViewInit{
  listOfUnits: number[] = [1,2,3,4];
  @Input() unitType!: string;
  unit!: Unit[];

  constructor(private state: State) {
    this.unit = state.units.filter(unit => {
      switch (this.unitType) {
        case "Door": return unit.unitType === UnitType.Door;
        case "Window": return unit.unitType === UnitType.Window;
        case "Motion Sensor": return unit.unitType === UnitType.MotionSensor;
        default: return false;
      }
    });
  }

  ngAfterViewInit(): void {
    this.loadUnits();
    }

  ngOnInit(): void { }

  loadUnits() {
    this.state.ws.send(JSON.stringify({
      eventType: "ClientOpensConnection"
    }));
  }
}
