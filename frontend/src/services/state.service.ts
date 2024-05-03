import {Injectable} from "@angular/core";
import {Unit} from "../models/Unit";
import {environment} from "../environments/environment";
import {BaseDto, ServerOpensConnectionDto, ServerShowsHistoryDto} from "../models/BaseDto";
import {HistoryModel} from "../models/HistoryModel";

@Injectable({
  providedIn: 'root'
})

export class State{
  units: Unit[]= [];
  history: HistoryModel[] = [];

  ws: WebSocket = new WebSocket(environment.baseUrl)

  constructor() {
    console.log("something happened before connect");
    this.ws.onmessage = message => {
      
      const messageFromServer = JSON.parse(message.data) as BaseDto<any>
      console.log("message from server received");
      // @ts-ignore
      this[messageFromServer.eventType].call(this, messageFromServer);
    }
  }

  ServerShowsHistory(dto: ServerShowsHistoryDto){
    this.history.push(...dto.responseDto.responseData);
  }

  ServerOpensConnection(dto: ServerOpensConnectionDto){
    this.units.push(...dto.responseDto.responseData);
  }
}
