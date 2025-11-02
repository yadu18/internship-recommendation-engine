<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - AI Internship Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-blue-50 via-white to-purple-50 min-h-screen p-6">
    <div class="max-w-4xl mx-auto py-8">
        <!-- Back to Home -->
        <div class="mb-6">
            <a href="index.jsp" class="text-gray-600 hover:text-blue-600 transition flex items-center">
                <i class="fas fa-arrow-left mr-2"></i> Back to Home
            </a>
        </div>

        <!-- Registration Card -->
        <div class="bg-white rounded-2xl shadow-2xl p-8 md:p-12">
            <!-- Header -->
            <div class="text-center mb-8">
                <div class="inline-block p-3 bg-blue-100 rounded-full mb-4">
                    <i class="fas fa-user-plus text-blue-600 text-4xl"></i>
                </div>
                <h2 class="text-3xl font-bold text-gray-900 mb-2">Create Your Profile</h2>
                <p class="text-gray-600">Fill in your details to get personalized internship recommendations</p>
            </div>

            <!-- Progress Bar -->
            <div class="mb-8">
                <div class="flex justify-between mb-2">
                    <span class="text-sm font-semibold text-blue-600" id="progressText">Step 1 of 3</span>
                    <span class="text-sm text-gray-600" id="progressPercent">33%</span>
                </div>
                <div class="w-full bg-gray-200 rounded-full h-2">
                    <div id="progressBar" class="bg-gradient-to-r from-blue-600 to-purple-600 h-2 rounded-full transition-all duration-300" style="width: 33%"></div>
                </div>
            </div>

            <!-- Multi-Step Form -->
            <form action="RegisterServlet" method="post" id="registerForm">
                <!-- Step 1: Basic Information -->
                <div class="step-content" id="step1">
                    <h3 class="text-xl font-bold text-gray-900 mb-6">
                        <i class="fas fa-user mr-2 text-blue-600"></i>Basic Information
                    </h3>
                    
                    <div class="grid md:grid-cols-2 gap-6">
                        <div>
                            <label for="name" class="block text-gray-700 font-semibold mb-2">Full Name *</label>
                            <input 
                                type="text" 
                                id="name" 
                                name="name" 
                                required
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                                placeholder="John Doe"
                            >
                        </div>
                        
                        <div>
                            <label for="contact" class="block text-gray-700 font-semibold mb-2">Email / Contact *</label>
                            <input 
                                type="email" 
                                id="contact" 
                                name="contact" 
                                required
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                                placeholder="john@example.com"
                            >
                        </div>

                        <div>
                            <label for="password" class="block text-gray-700 font-semibold mb-2">Password *</label>
                            <input 
                                type="password" 
                                id="password" 
                                name="password" 
                                required
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                                placeholder="Create a strong password"
                            >
                        </div>

                        <div>
                            <label for="confirmPassword" class="block text-gray-700 font-semibold mb-2">Confirm Password *</label>
                            <input 
                                type="password" 
                                id="confirmPassword" 
                                name="confirmPassword" 
                                required
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                                placeholder="Re-enter password"
                            >
                        </div>
                    </div>
                </div>

                <!-- Step 2: Education & Skills -->
                <div class="step-content hidden" id="step2">
                    <h3 class="text-xl font-bold text-gray-900 mb-6">
                        <i class="fas fa-graduation-cap mr-2 text-blue-600"></i>Education & Skills
                    </h3>
                    
                    <div class="grid md:grid-cols-2 gap-6">
                        <div>
                            <label for="education_qualification" class="block text-gray-700 font-semibold mb-2">Education Level *</label>
                            <select 
                                id="education_qualification" 
                                name="education_qualification" 
                                required
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                            >
                                <option value="">Select education level</option>
                                <option value="High School">High School</option>
                                <option value="Diploma">Diploma</option>
                                <option value="Bachelor's">Bachelor's Degree</option>
                                <option value="Master's">Master's Degree</option>
                                <option value="PhD">PhD</option>
                            </select>
                        </div>

                        <div>
                            <label for="current_course" class="block text-gray-700 font-semibold mb-2">Current Course</label>
                            <input 
                                type="text" 
                                id="current_course" 
                                name="current_course"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                                placeholder="e.g., Computer Science"
                            >
                        </div>

                        <div>
                            <label for="branch_major" class="block text-gray-700 font-semibold mb-2">Branch / Major</label>
                            <input 
                                type="text" 
                                id="branch_major" 
                                name="branch_major"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                                placeholder="e.g., AI/ML"
                            >
                        </div>

                        <div>
                            <label for="year_semester" class="block text-gray-700 font-semibold mb-2">Year / Semester</label>
                            <input 
                                type="text" 
                                id="year_semester" 
                                name="year_semester"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                                placeholder="e.g., 3rd Year"
                            >
                        </div>

                        <div class="md:col-span-2">
                            <label for="skills" class="block text-gray-700 font-semibold mb-2">Skills (comma-separated) *</label>
                            <textarea 
                                id="skills" 
                                name="skills" 
                                required
                                rows="3"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                                placeholder="e.g., Python, Java, Machine Learning, Data Analysis"
                            ></textarea>
                            <p class="text-sm text-gray-500 mt-1">Separate skills with commas</p>
                        </div>

                        <div class="md:col-span-2">
                            <label for="interests" class="block text-gray-700 font-semibold mb-2">Interests</label>
                            <textarea 
                                id="interests" 
                                name="interests"
                                rows="3"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                                placeholder="e.g., AI, Web Development, Data Science"
                            ></textarea>
                        </div>
                    </div>
                </div>

                <!-- Step 3: Preferences -->
                <div class="step-content hidden" id="step3">
                    <h3 class="text-xl font-bold text-gray-900 mb-6">
                        <i class="fas fa-sliders-h mr-2 text-blue-600"></i>Your Preferences
                    </h3>
                    
                    <div class="grid md:grid-cols-2 gap-6">
                        <div>
                            <label for="preferred_locations" class="block text-gray-700 font-semibold mb-2">Preferred Locations</label>
                            <input 
                                type="text" 
                                id="preferred_locations" 
                                name="preferred_locations"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                                placeholder="e.g., Bangalore, Mumbai, Remote"
                            >
                        </div>

                        <div>
                            <label for="preferred_mode" class="block text-gray-700 font-semibold mb-2">Preferred Mode</label>
                            <select 
                                id="preferred_mode" 
                                name="preferred_mode"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                            >
                                <option value="">Select mode</option>
                                <option value="Remote">Remote</option>
                                <option value="Hybrid">Hybrid</option>
                                <option value="On-site">On-site</option>
                                <option value="Any">Any</option>
                            </select>
                        </div>

                        <div>
                            <label for="experience_level" class="block text-gray-700 font-semibold mb-2">Experience Level</label>
                            <select 
                                id="experience_level" 
                                name="experience_level"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                            >
                                <option value="">Select level</option>
                                <option value="Beginner">Beginner</option>
                                <option value="Intermediate">Intermediate</option>
                                <option value="Advanced">Advanced</option>
                            </select>
                        </div>

                        <div>
                            <label for="languages_known" class="block text-gray-700 font-semibold mb-2">Languages Known</label>
                            <input 
                                type="text" 
                                id="languages_known" 
                                name="languages_known"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                                placeholder="e.g., English, Hindi, Spanish"
                            >
                        </div>

                        <div class="md:col-span-2">
                            <label class="flex items-center">
                                <input type="checkbox" name="terms" required class="w-4 h-4 text-blue-600 rounded focus:ring-blue-500">
                                <span class="ml-2 text-gray-600">
                                    I agree to the <a href="#" class="text-blue-600 hover:underline">Terms of Service</a> and 
                                    <a href="#" class="text-blue-600 hover:underline">Privacy Policy</a>
                                </span>
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Navigation Buttons -->
                <div class="flex justify-between mt-8">
                    <button 
                        type="button" 
                        id="prevBtn" 
                        onclick="changeStep(-1)"
                        class="px-6 py-3 bg-gray-200 text-gray-700 rounded-lg font-semibold hover:bg-gray-300 transition hidden"
                    >
                        <i class="fas fa-arrow-left mr-2"></i>Previous
                    </button>
                    
                    <div class="ml-auto flex gap-3">
                        <button 
                            type="button" 
                            id="nextBtn" 
                            onclick="changeStep(1)"
                            class="px-6 py-3 bg-blue-600 text-white rounded-lg font-semibold hover:bg-blue-700 transition"
                        >
                            Next<i class="fas fa-arrow-right ml-2"></i>
                        </button>
                        
                        <button 
                            type="submit" 
                            id="submitBtn" 
                            class="px-6 py-3 bg-gradient-to-r from-blue-600 to-purple-600 text-white rounded-lg font-semibold hover:from-blue-700 hover:to-purple-700 transition hidden"
                        >
                            <i class="fas fa-check mr-2"></i>Complete Registration
                        </button>
                    </div>
                </div>
            </form>

            <!-- Login Link -->
            <div class="mt-8 text-center">
                <p class="text-gray-600">
                    Already have an account? 
                    <a href="login.jsp" class="text-blue-600 hover:text-blue-700 font-semibold">Login here</a>
                </p>
            </div>
        </div>
    </div>

    <script>
        let currentStep = 1;
        const totalSteps = 3;

        function showStep(step) {
            const steps = document.querySelectorAll('.step-content');
            steps.forEach((el, index) => {
                el.classList.toggle('hidden', index + 1 !== step);
            });

            document.getElementById('prevBtn').classList.toggle('hidden', step === 1);
            document.getElementById('nextBtn').classList.toggle('hidden', step === totalSteps);
            document.getElementById('submitBtn').classList.toggle('hidden', step !== totalSteps);

            const progress = (step / totalSteps) * 100;
            document.getElementById('progressBar').style.width = progress + '%';
            document.getElementById('progressText').textContent = `Step ${step} of ${totalSteps}`;
            document.getElementById('progressPercent').textContent = Math.round(progress) + '%';
        }

        function changeStep(direction) {
            if (direction === 1 && !validateCurrentStep()) {
                return;
            }

            currentStep += direction;
            if (currentStep < 1) currentStep = 1;
            if (currentStep > totalSteps) currentStep = totalSteps;
            
            showStep(currentStep);
        }

        function validateCurrentStep() {
            const currentStepDiv = document.getElementById('step' + currentStep);
            const inputs = currentStepDiv.querySelectorAll('input[required], select[required], textarea[required]');
            
            for (let input of inputs) {
                if (!input.value.trim()) {
                    alert('Please fill in all required fields');
                    input.focus();
                    return false;
                }
            }

            if (currentStep === 1) {
                const password = document.getElementById('password').value;
                const confirmPassword = document.getElementById('confirmPassword').value;
                
                if (password !== confirmPassword) {
                    alert('Passwords do not match');
                    return false;
                }

                if (password.length < 6) {
                    alert('Password must be at least 6 characters long');
                    return false;
                }
            }

            return true;
        }

        document.getElementById('registerForm').addEventListener('submit', function(e) {
            if (!validateCurrentStep()) {
                e.preventDefault();
                return false;
            }
        });

        // Initialize
        showStep(1);
    </script>
</body>
</html>