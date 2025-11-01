<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\EmployeeRequest;

class EmployeeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
         if ($request->ajax()) {
            $data = Employee::latest()->get();
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('avatar', function ($row) {
                    $avatarUrl = $row->avatar ? asset('storage/'.$row->avatar) : asset('images/default-avatar.png');
                    return '<img src="'.$avatarUrl.'" class="rounded-circle" width="40" height="40">';
                })
                ->addColumn('action', function($row){
                    return '
                        <button class="btn btn-sm btn-primary editBtn" data-id="'.$row->id.'"><i class="ri-pencil-fill"></i></button>
                        <button class="btn btn-sm btn-danger deleteBtn" data-id="'.$row->id.'"><i class="ri-delete-bin-fill"></i></button>
                    ';
                })
                ->rawColumns(['avatar','action'])
                ->make(true);
        }
        return view('employees.index');
    }

    public function edit(Employee $employee)
{
    return response()->json($employee);
}


    public function store(EmployeeRequest $request)
    {
        $data = $request->validated();
        if ($request->hasFile('avatar')) {
            $data['avatar'] = $request->file('avatar')->store('avatars','public');
        }
        $emp = Employee::create($data);
        return response()->json(['success'=>true,'message'=>'Employee created successfully']);
    }

    public function show(Employee $employee)
    {
        return response()->json(['success'=>true,'data'=>$employee]);
    }

    public function update(EmployeeRequest $request, Employee $employee)
    {
        $data = $request->validated();
        if ($request->hasFile('avatar')) {
            if ($employee->avatar && Storage::disk('public')->exists($employee->avatar)) {
                Storage::disk('public')->delete($employee->avatar);
            }
            $data['avatar'] = $request->file('avatar')->store('avatars','public');
        }
        $employee->update($data);
        return response()->json(['success'=>true,'message'=>'Employee updated successfully']);
    }

    public function destroy(Employee $employee)
    {
        if ($employee->avatar && Storage::disk('public')->exists($employee->avatar)) {
            Storage::disk('public')->delete($employee->avatar);
        }
        $employee->delete();
        return response()->json(['success'=>true,'message'=>'Employee deleted successfully']);
    }
}
