import {Injectable} from "@angular/core";
import {Unit} from "../models/Unit";
import {environment} from "../environments/environment";
import {BaseDto, ServerShowsHistoryDto} from "../models/BaseDto";
import {HistoryModel} from "../models/HistoryModel";

@Injectable({
  providedIn: 'root'
})

export class State{
  units: Unit[]= [];
  history: HistoryModel[] = [];

  ws: WebSocket = new WebSocket(environment.baseUrl)

  constructor() {
    this.ws.onmessage = message => {
      const messageFromServer = JSON.parse(message.data) as BaseDto<any>

      // @ts-ignore
      this[messageFromServer.eventType].call(this, messageFromServer);
    }
  }
  
  ServerShowsHistory(dto: ServerShowsHistoryDto){
    this.history = dto.responseDto.map(response => response.responseData);
  }
}
