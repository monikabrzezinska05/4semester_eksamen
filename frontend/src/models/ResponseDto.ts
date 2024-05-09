export interface ResponseDto<T> {
  messageToClient: string;
  responseData: T;
  jwt: string;
}
