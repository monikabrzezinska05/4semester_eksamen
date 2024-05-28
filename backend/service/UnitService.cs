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

    public Unit SetUnitStatus(int unitId, Status status)
    {
        return _unitRepository.SetUnitStatus(unitId, status);
    }

    public List<Unit> SetAllUnitStatus(Status status)
    {
        return _unitRepository.SetAllUnitStatus(status);
    }

    public List<Unit> SetAllWindowDoorStatus(Status status)
    {
        Console.WriteLine("status service" + status);

        return _unitRepository.SetAllWindowDoorStatus(status);
    }

    public List<Unit> getUnitsById(List<int> unitIds)
    {
        return _unitRepository.GetUnitsById(unitIds);
    }

    public void SetMotionSensorStatus(Status armed)
    {
        _unitRepository.SetMotionSensorStatus(armed);
    }
}