import {Injectable} from "@angular/core";
import {Unit, UnitType} from "../models/Unit";
import {environment} from "../environments/environment";
import {BaseDto, ServerOpensConnectionDto, ServerShowsHistoryDto} from "../models/BaseDto";
import {HistoryModel} from "../models/HistoryModel";

@Injectable({
  providedIn: 'root'
})

export class State {
  units: Unit[] = [];
  history: HistoryModel[] = [];

  ws: WebSocket = new WebSocket(environment.baseUrl);

  constructor() {
    console.log("something happened before connect");
    this.ws.onmessage = message => {

      const messageFromServer = JSON.parse(message.data) as BaseDto<any>
      console.log("message from server received", messageFromServer);
      // @ts-ignore
      this[messageFromServer.eventType].call(this, messageFromServer);
    }

    this.ws.onopen = () => {
      this.ws.send(JSON.stringify({
        eventType: "ClientOpensConnection"
      }));
    };
  }

  ServerShowsHistory(dto: ServerShowsHistoryDto) {
    this.history = [...this.history, ...dto.responseDto.responseData];
  }

  ServerOpensConnection(dto: ServerOpensConnectionDto) {
    console.log("First line: ", JSON.parse(JSON.stringify(dto)));
    this.units = [...this.units, ...dto.responseDto.responseData];
    console.log("done working on message thingy");
    console.log(this.units);
  }
}
