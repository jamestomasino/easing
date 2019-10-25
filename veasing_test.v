import veasing
import math

//
// Veasing Tests
//


//
// Linear tests

fn test_linear_interpolation() {
  assert compare(veasing.linear_interpolation(2), 2.00) 
}

//
// Quadratic tests

fn test_quadratic_ease_in() {
  assert compare(veasing.quadratic_ease_in(2), 4.00)  
}

fn test_quadratic_ease_out() {
  assert compare(veasing.quadratic_ease_out(5), -15.00) 
}

fn test_quadratic_ease_in_out() {
  // p < 0.5
  assert compare(veasing.quadratic_ease_in_out(0.4), 0.32)   
  // p >= 0.5
  assert compare(veasing.quadratic_ease_in_out(0.6), 0.68)
}

//
// Cubic tests

fn test_cubic_ease_in() {
  assert compare(veasing.cubic_ease_in(3),  27.00) 
}

fn test_cubic_ease_out() {
  assert compare(veasing.cubic_ease_out(4), 28.00) 
}

fn test_cubic_ease_in_out() {
  // p < 0.5
  assert compare(veasing.cubic_ease_in_out(0.4),  0.256) 
  // p >= 0.5
  assert compare(veasing.cubic_ease_in_out(0.6),  0.744)
}

//
// Quadratic tests

fn test_quartic_ease_in() {
  assert compare(veasing.quartic_ease_in(3), 81.00) 
}

fn test_quartic_ease_out() {
  assert compare(veasing.quartic_ease_out(3), -15.00)
}

fn test_quartic_ease_in_out() {
  // p < 0.5
  assert compare(veasing.quartic_ease_in_out(0.4), 0.2048) 
  // p >= 0.5
  assert compare(veasing.quartic_ease_in_out(0.6), 0.7952) 
}

//
// Quintic tests

fn test_quintic_ease_in() {
  assert compare(veasing.quintic_ease_in(4), 1024.00) 
}

fn test_quintic_ease_out() {
  assert compare(veasing.quintic_ease_out(4), 244.00) 
}

fn test_quintic_ease_in_out() {
  // p < 0.5
  assert compare(veasing.quintic_ease_in_out(0.4), 0.16384)  
  // p >= 0.5
  assert compare(veasing.quintic_ease_in_out(0.6), 0.83616)
}

//
// Sine tests

fn test_sine_ease_in() {
  assert compare(veasing.sine_ease_in(3), 1.00)    
}

fn test_sine_ease_out() {
  // FIXME
  assert compare(veasing.sine_ease_out(3), 0.000000) 
}

fn test_sine_ease_in_out() {
  assert compare(veasing.sine_ease_in_out(3), 1.00) 
}

//
// Circular tests

fn test_circular_ease_in() {
  assert compare(veasing.circular_ease_in(0.4), 0.083485) 
}

fn test_circular_ease_out() {
  assert compare(veasing.circular_ease_out(0.4), 0.80) 
}

fn test_circular_ease_in_out() {
  // p < 0.5
  assert compare(veasing.circular_ease_in_out(0.4), 0.20) 
  // p >= 0.5
  assert compare(veasing.circular_ease_in_out(0.6), 0.80) 
}

//
// Exponential tests
fn test_exponential_ease_in() {
  assert compare(veasing.exponential_ease_in(2), 1024.00)
}

fn test_exponential_ease_out() {
  assert compare(veasing.exponential_ease_out(2), 0.999999) 
}

fn test_exponential_ease_in_out() {
  // p = 0
  assert compare(veasing.exponential_ease_in_out(0), 0.00) 
  // p = 1
  assert compare(veasing.exponential_ease_in_out(1), 1.00)
  // p < 0.5
  assert compare(veasing.exponential_ease_in_out(0.4), 0.125) 
  // p >= 0.5
  assert compare(veasing.exponential_ease_in_out(0.6), 0.875) 
}

//
// Elastic tests

fn test_elastic_ease_in() {
  //FIXME
  assert compare(veasing.elastic_ease_in(2), 0.00)    
}

fn test_elastic_ease_out() {
  assert compare(veasing.elastic_ease_out(2), 1.00) 
}

fn test_elastic_ease_in_out() {
  // p < 0.5
  assert compare(veasing.elastic_ease_in_out(0.4), 0.073473) 
  // p >= 0.5
  assert compare(veasing.elastic_ease_in_out(0.6), 1.073473) 
}

//
// Back tests

fn test_back_ease_in() {
  assert compare(veasing.back_ease_in(2), 8.00) 
}

fn test_back_ease_out() {
  assert compare(veasing.back_ease_out(2), 2.00) 
}

fn test_back_ease_in_out() {
  // p < 0.5
  assert compare(veasing.back_ease_in_out(0.4), 0.020886) 
  // p >= 0.5
  assert compare(veasing.back_ease_in_out(0.6), 0.979114)
}

//
// Bounce tests

fn test_bounce_ease_in() {
  assert compare(veasing.bounce_ease_in(2), -6.562500) 
}

fn test_bounce_ease_out() {
  // p < 4 / 11.0
  assert compare(veasing.bounce_ease_out(0.35), 0.926406)
  // p < 8.0 / 11.0
  assert compare(veasing.bounce_ease_out(0.70), 0.916750)
  // p < 9.0 / 10.0
  assert compare(veasing.bounce_ease_out(0.89), 0.980365)
  // p >= 9.0 / 10.0
  assert compare(veasing.bounce_ease_out(0.91), 0.990280)
}

fn test_bounce_ease_in_out() {
  // p < 0.5
  assert compare(veasing.bounce_ease_in_out(0.4), 0.348750) 
  // p >= 0.5
  assert compare(veasing.bounce_ease_in_out(0.6), 0.651250)
}

// Helper method for comparing floats
fn compare(x f64, y f64) bool {
  tolerance := 0.00001
  diff := math.abs(x - y)
  mean := math.abs(x + y) / 2.0
  if math.is_nan(diff / mean) {
    return true
  }
  return (diff / mean) < tolerance
}

