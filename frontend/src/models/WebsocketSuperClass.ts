import ReconnectingWebSocket from 'reconnecting-websocket';
import {BaseDto} from "./BaseDto";
import {ClientWantsToAuthenticateWithJwt} from "./ClientWantsToAuthenticateWithJwt";

export class WebsocketSuperClass extends ReconnectingWebSocket{
  private messageQueue: Array<BaseDto<any>> = [];

  constructor(address: string){
    super(address);
    this.onopen = this.onopen!.bind(this);
  }

  sendDto(dto: BaseDto<any>){
    if(this.readyState === this.OPEN){
      this.send(JSON.stringify(dto));
    } else {
      this.messageQueue.push(dto);
    }
  }

  private handleOpen(){
    let jwt = localStorage.getItem('JWT_KEY');
    if(jwt && jwt != ""){
      this.sendDto(new ClientWantsToAuthenticateWithJwt({jwt: jwt}));

      while (this.messageQueue.length > 0){
        const dto = this.messageQueue.shift();
        if(dto){
          this.sendDto(dto);
        }
      }
    }
  }
}
