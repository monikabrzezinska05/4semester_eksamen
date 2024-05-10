import {BaseDto} from "./BaseDto";

export class ClientWantsToLogoff extends BaseDto<ClientWantsToLogoff> {
  email?: string;
  password?: string;
}
