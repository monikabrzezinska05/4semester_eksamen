using infrastructure.models;
using infrastructure.repositories;

namespace service;

public class UnitService
{
    private readonly UnitRepository _unitRepository;
    
    public UnitService(UnitRepository unitRepository)
    {
        _unitRepository = unitRepository;
    }

    public Unit GetUnitById(int unitId)
    {
        return _unitRepository.GetUnitById(unitId);
    }

    public List<Unit> GetAllUnits()
    {
        return _unitRepository.GetAllUnits();
    }

    public Unit SetUnitStatus(int unitId, int status)
    {
        return _unitRepository.SetUnitStatus(unitId, status);
    }

    public List<Unit> SetAllUnitStatus(int status)
    {
        return _unitRepository.SetAllUnitStatus(status);
    }

    public List<Unit> SetWindowDoorStatus(int status)
    {
        return _unitRepository.SetWindowDoorStatus(status);
    }
}