import {Injectable} from "@angular/core";
import {Unit} from "../models/Unit";
import {environment} from "../environments/environment";
import {BaseDto, ServerAuthenticatesUserDto, ServerOpensConnectionDto, ServerShowsHistoryDto} from "../models/BaseDto";
import {HistoryModel} from "../models/HistoryModel";
import {UserModel} from "../models/UserModel";
import {Router} from "@angular/router";

@Injectable({
  providedIn: 'root'
})

export class State {
  units: Unit[] = [];
  history: HistoryModel[] = [];
  private authenticated: boolean = false;
  currentUser?: UserModel;

  ws: WebSocket = new WebSocket(environment.websocketBaseUrl);

  constructor(private router: Router) {
    console.log("something happened before connect");
    this.ws.onmessage = message => {

      const messageFromServer = JSON.parse(message.data) as BaseDto<any>
      console.log("message from server received");
      // @ts-ignore
      this[messageFromServer.eventType].call(this, messageFromServer);
    }
  }

  ServerShowsHistory(dto: ServerShowsHistoryDto) {
    this.history.push(...dto.responseDto.responseData);
  }

  ServerAuthenticatesUser(dto: ServerAuthenticatesUserDto) {
    if (dto.responseDto !== null && dto.jwt !== null) {
      this.authenticated = true;
      this.currentUser = dto.responseDto;
      console.log("authentication happens in frontend");
      this.router.navigateByUrl('');
    }
  }

  ServerOpensConnection(dto: ServerOpensConnectionDto) {
    this.units.push(...dto.responseDto);
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
