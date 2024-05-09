import {AfterViewInit, Component, Input, OnInit} from '@angular/core';
import {CommonModule} from "@angular/common";
import {Unit, UnitType} from "../../models/Unit";
import {State} from "../../services/state.service";
import {NgArrayPipesModule} from "ngx-pipes";

@Component({
  selector: 'app-overview',
  standalone: true,
  imports: [CommonModule, NgArrayPipesModule],
  templateUrl: './overview.component.html',
  styleUrl: './overview.component.css'
})

export class OverviewComponent implements OnInit {
  listOfUnits: number[] = [1, 2, 3, 4];
  @Input() unitType!: number;
  units!: Unit[];

  constructor(public state: State) {}



  ngOnInit(): void {
    setTimeout(() => {
      this.insertUnits()
    }, 0);
    //this.insertUnits()
  }

  insertUnits() {
    console.log(this.state.units)
    console.log("Entered insertUnits()", this.unitType)
    this.units = this.state.units.filter(u => {
      console.log(u)
      console.log(this.unitType)
      return u.UnitTypeId == this.unitType;
  });
  }
}
