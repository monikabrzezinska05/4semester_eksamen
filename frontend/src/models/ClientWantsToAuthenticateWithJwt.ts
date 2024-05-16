import {BaseDto} from "./BaseDto";

export class ClientWantsToAuthenticateWithJwt extends BaseDto<ClientWantsToAuthenticateWithJwt>{
  jwt?: string;
}
