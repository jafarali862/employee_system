<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class EmployeeFactory extends Factory
{
    public function definition()
    {
        return [
            'full_name'  => $this->faker->name(),
            'email'      => $this->faker->unique()->safeEmail(),
            'mobile'     => $this->faker->phoneNumber(),
            'department' => $this->faker->randomElement(['HR','IT','Sales','Finance','Support']),
            'designation'=> $this->faker->jobTitle(),
            'avatar'     => null,
        ];
    }
}
