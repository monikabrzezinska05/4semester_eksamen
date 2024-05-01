import {Injectable} from "@angular/core";
import {Unit} from "../models/Unit";
import {environment} from "../environments/environment";
import {BaseDto} from "../models/BaseDto";

@Injectable({
  providedIn: 'root'
})

export class State{
  units: Unit[]= [];
  ws: WebSocket = new WebSocket(environment.baseUrl)

  constructor() {
    this.ws.onmessage = message => {
      const messageFromServer = JSON.parse(message.data) as BaseDto<any>

      // @ts-ignore
      this[messageFromServer.eventType].call(this, messageFromServer);
    }
  }
}



