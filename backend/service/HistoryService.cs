using infrastructure.models;
using infrastructure.repositories;
using Microsoft.Extensions.Logging;

namespace service;

public class HistoryService
{
    private readonly HistoryRepo _historyRepo;
    private readonly ILogger<HistoryService> _logger;
    
    public HistoryService(HistoryRepo historyRepo, ILogger<HistoryService> logger)
    {
        _historyRepo = historyRepo;
        _logger = logger;
    }

    public HistoryModel GetHistory()
    {
        return _historyRepo.GetHistory();
    }

    public HistoryModel CreateHistory(HistoryModel model)
    {
        return _historyRepo.CreateHistory(model);
    }

}


