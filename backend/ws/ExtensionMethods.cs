﻿using System.Text.Json;
using Fleck;
using lib;

namespace ws;

// Bliver den her klasse brugt til noget? @peder
public static class ExtensionMethods
{
    public static void SendDto<T>(this IWebSocketConnection ws, T dto) where T : BaseDto
    {
        ws.Send(JsonSerializer.Serialize(dto) ?? throw new ArgumentException("Failed to serialize dto."));
    }
}