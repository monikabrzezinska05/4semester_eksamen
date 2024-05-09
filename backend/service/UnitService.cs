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

    public Unit getUnitById(int unitId)
    {
        return _unitRepository.getUnitById(unitId);
    }
}