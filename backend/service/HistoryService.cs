using infrastructure.models;
using infrastructure.repositories;
using Newtonsoft.Json;

namespace service;

public class HistoryService
{
    private readonly HistoryRepository _historyRepository;
    
    public HistoryService(HistoryRepository historyRepository)
    {
        _historyRepository = historyRepository;
    }

    public List<HistoryModel> GetHistory(DateTime? timePeriod)
    {
        var histories = _historyRepository.GetHistory(timePeriod);

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
        var history = _historyRepository.CreateHistory(model);
        
        List<Unit> units = JsonConvert.DeserializeObject<List<Unit>>(history.UnitTable);
        history.Unit = units[0];
        history.UnitTable = null;

        return history;
    }
}


