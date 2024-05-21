using infrastructure.models;
using infrastructure.repositories;
using Newtonsoft.Json;

namespace service;

public class HistoryService
{
    private readonly HistoryRepo _historyRepo;
    
    public HistoryService(HistoryRepo historyRepo)
    {
        _historyRepo = historyRepo;
    }

    public List<HistoryModel> GetHistory(DateTime? timePeriod)
    {
        var histories = _historyRepo.GetHistory(timePeriod);

        foreach (var history in histories)
        {
            List<Unit> units = JsonConvert.DeserializeObject<List<Unit>>(history.UnitTable);
            history.Unit = units[0];
            history.UnitTable = null;
        }
        
        return histories;
    }

    public HistoryModel CreateHistory(HistoryModel model)
    {
        var history = _historyRepo.CreateHistory(model);
        
        List<Unit> units = JsonConvert.DeserializeObject<List<Unit>>(history.UnitTable);
        history.Unit = units[0];
        history.UnitTable = null;

        return history;
    }
}


