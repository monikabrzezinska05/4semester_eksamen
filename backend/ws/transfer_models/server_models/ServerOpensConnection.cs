﻿using api.transfer_models;
using infrastructure.models;
using lib;

namespace ws.transfer_models.server_models;

public class ServerOpensConnection : BaseDto
{
    public List<Unit> ResponseDto { get; set; }
}