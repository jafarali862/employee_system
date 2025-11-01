<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmployeeRequest extends FormRequest
{
    public function authorize() { return true; }

    public function rules()
    {
        $employeeId = $this->route('employee')?->id ?? $this->route('employee');
        return [
            'full_name' => 'required|string|max:191',
            'email' => 'required|email|max:191|unique:employees,email,'.$employeeId,
            'mobile' => 'nullable|string|max:30',
            'department' => 'nullable|string|max:100',
            'designation' => 'nullable|string|max:100',
            'avatar' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ];
    }
}
