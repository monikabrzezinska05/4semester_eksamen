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

    public List<HistoryModel> GetHistory(DateTime? timePeriod)
    {
        return _historyRepo.GetHistory(timePeriod);
    }

    public HistoryModel CreateHistory(HistoryModel model)
    {
        Console.WriteLine("history service");
        return _historyRepo.CreateHistory(model);
    }

}


