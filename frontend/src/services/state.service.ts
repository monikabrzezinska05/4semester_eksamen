import {Injectable} from "@angular/core";
import {Unit} from "../models/Unit";
import {environment} from "../environments/environment";
import {BaseDto, ServerOpensConnectionDto, ServerShowsHistoryDto} from "../models/BaseDto";
import {HistoryModel} from "../models/HistoryModel";

@Injectable({
  providedIn: 'root'
})

export class State {
  units: Unit[] = [];
  history: HistoryModel[] = [];

  ws: WebSocket = new WebSocket(environment.websocketBaseUrl);

  constructor() {
    console.log("something happened before connect");
    this.ws.onmessage = message => {

      const messageFromServer = JSON.parse(message.data) as BaseDto<any>
      console.log("message from server received");
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
    this.history.push(...dto.responseDto.ResponseData);
  }

  ServerOpensConnection(dto: ServerOpensConnectionDto) {
    this.units.push(...dto.ResponseDto);
    console.log("done working on message thingy");
    console.log(this.units);
    /*this.units = [{
      UnitId: 0,
      Name: "Test",
      UnitTypeId: 0,
      Status: false
    },
      {
        UnitId: 1,
        Name: "Test2",
        UnitTypeId: 0,
        Status: false
      }];*/
  }
}
