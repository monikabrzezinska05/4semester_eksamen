import {Injectable} from "@angular/core";
import {WebsocketSuperClass} from "./models/WebsocketSuperClass";
import {environment} from "./environments/environment";
import {BaseDto} from "./models/BaseDto";
import {ServerAuthenticatesUser} from "./models/serverAuthenticatesUser";
import {MessageService} from "primeng/api";


@Injectable({
  providedIn: 'root'
})
 export class WsClientService {
  public socketConnection: WebsocketSuperClass;

  constructor(public messageService: MessageService) {
    this.socketConnection = new WebsocketSuperClass(environment.websocketBaseUrl);
    this.handleEventsEmittedByServer();
  }

  handleEventsEmittedByServer() {
    this.socketConnection.onmessage = (event) => {
      const data = JSON.parse(event.data) as BaseDto<any>;
      // @ts-ignore
      this[data.eventType].call(this, data);
    }
    this.socketConnection.onerror = (error) => {
      this.messageService.add({life: 5000, severity: 'error', summary: 'Error', detail: 'The Websocket connection has encountered an error'});
    }
  }


  ServerAuthenticatesUser(dto: ServerAuthenticatesUser) {
    this.messageService.add({life: 2000, detail: 'You have been authenticated'});
    localStorage.setItem('JWT_KEY', dto.jwt!);
  }

  ServerAuthenticatesUserWithJwt(dto: ServerAuthenticatesUser) {
    this.messageService.add({life: 2000, summary: 'success', detail: 'You have been authenticated'});
  }
}
