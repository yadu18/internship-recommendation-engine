<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Internship Portal - Find Your Perfect Internship</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-blue-50 via-white to-purple-50 min-h-screen">
    <!-- Navigation -->
    <nav class="bg-white shadow-md fixed w-full top-0 z-50">
        <div class="container mx-auto px-6 py-4">
            <div class="flex items-center justify-between">
                <div class="flex items-center space-x-2">
                    <i class="fas fa-brain text-blue-600 text-3xl"></i>
                    <span class="text-2xl font-bold text-gray-800">AI Internship Portal</span>
                </div>
                <div class="hidden md:flex space-x-6">
                    <a href="#features" class="text-gray-600 hover:text-blue-600 transition">Features</a>
                    <a href="#how-it-works" class="text-gray-600 hover:text-blue-600 transition">How It Works</a>
                    <a href="#about" class="text-gray-600 hover:text-blue-600 transition">About</a>
                </div>
                <div class="flex space-x-4">
                    <a href="login.jsp" class="px-6 py-2 text-blue-600 border border-blue-600 rounded-lg hover:bg-blue-50 transition">Login</a>
                    <a href="register.jsp" class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition">Get Started</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="pt-32 pb-20 px-6">
        <div class="container mx-auto text-center max-w-5xl">
            <div class="mb-8">
                <span class="inline-block px-4 py-2 bg-blue-100 text-blue-600 rounded-full text-sm font-semibold mb-6">
                    AI-Powered Matching
                </span>
            </div>
            <h1 class="text-5xl md:text-6xl font-bold text-gray-900 mb-6 leading-tight">
                Find Internships That
                <span class="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-purple-600">
                    Match Your Skills
                </span>
            </h1>
            <p class="text-xl text-gray-600 mb-12 max-w-3xl mx-auto">
                Let our intelligent recommendation system analyze your profile and connect you with the perfect internship opportunities from top companies worldwide.
            </p>
            <div class="flex flex-col sm:flex-row justify-center gap-4">
                <a href="register.jsp" class="px-8 py-4 bg-blue-600 text-white rounded-lg text-lg font-semibold hover:bg-blue-700 transition transform hover:scale-105 shadow-lg">
                    Start Your Journey
                    <i class="fas fa-arrow-right ml-2"></i>
                </a>
                <a href="#how-it-works" class="px-8 py-4 bg-white text-gray-700 rounded-lg text-lg font-semibold hover:bg-gray-50 transition shadow-lg">
                    Learn More
                    <i class="fas fa-play-circle ml-2"></i>
                </a>
            </div>

            <!-- Stats -->
            <div class="grid grid-cols-3 gap-8 mt-20 max-w-3xl mx-auto">
                <div>
                    <div class="text-4xl font-bold text-blue-600">1000+</div>
                    <div class="text-gray-600 mt-2">Active Internships</div>
                </div>
                <div>
                    <div class="text-4xl font-bold text-purple-600">95%</div>
                    <div class="text-gray-600 mt-2">Match Accuracy</div>
                </div>
                <div>
                    <div class="text-4xl font-bold text-green-600">500+</div>
                    <div class="text-gray-600 mt-2">Partner Companies</div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="py-20 bg-white">
        <div class="container mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-4xl font-bold text-gray-900 mb-4">Powerful Features</h2>
                <p class="text-xl text-gray-600">Everything you need to find your perfect internship</p>
            </div>
            <div class="grid md:grid-cols-3 gap-8 max-w-6xl mx-auto">
                <div class="p-8 bg-gradient-to-br from-blue-50 to-blue-100 rounded-xl hover:shadow-xl transition">
                    <div class="w-16 h-16 bg-blue-600 rounded-lg flex items-center justify-center mb-6">
                        <i class="fas fa-robot text-white text-2xl"></i>
                    </div>
                    <h3 class="text-2xl font-bold text-gray-900 mb-4">AI Matching</h3>
                    <p class="text-gray-600">Advanced algorithms analyze your skills and preferences to find the best matches</p>
                </div>
                <div class="p-8 bg-gradient-to-br from-purple-50 to-purple-100 rounded-xl hover:shadow-xl transition">
                    <div class="w-16 h-16 bg-purple-600 rounded-lg flex items-center justify-center mb-6">
                        <i class="fas fa-clock text-white text-2xl"></i>
                    </div>
                    <h3 class="text-2xl font-bold text-gray-900 mb-4">Real-Time Updates</h3>
                    <p class="text-gray-600">Get instant notifications about new opportunities that match your profile</p>
                </div>
                <div class="p-8 bg-gradient-to-br from-green-50 to-green-100 rounded-xl hover:shadow-xl transition">
                    <div class="w-16 h-16 bg-green-600 rounded-lg flex items-center justify-center mb-6">
                        <i class="fas fa-chart-line text-white text-2xl"></i>
                    </div>
                    <h3 class="text-2xl font-bold text-gray-900 mb-4">Smart Analytics</h3>
                    <p class="text-gray-600">Track your applications and get insights to improve your success rate</p>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section id="how-it-works" class="py-20 bg-gradient-to-br from-gray-50 to-blue-50">
        <div class="container mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-4xl font-bold text-gray-900 mb-4">How It Works</h2>
                <p class="text-xl text-gray-600">Get started in three simple steps</p>
            </div>
            <div class="max-w-5xl mx-auto">
                <div class="grid md:grid-cols-3 gap-8">
                    <div class="text-center">
                        <div class="w-20 h-20 bg-blue-600 text-white rounded-full flex items-center justify-center text-3xl font-bold mx-auto mb-6">1</div>
                        <h3 class="text-2xl font-bold text-gray-900 mb-4">Create Profile</h3>
                        <p class="text-gray-600">Fill in your skills, education, and preferences to build your profile</p>
                    </div>
                    <div class="text-center">
                        <div class="w-20 h-20 bg-purple-600 text-white rounded-full flex items-center justify-center text-3xl font-bold mx-auto mb-6">2</div>
                        <h3 class="text-2xl font-bold text-gray-900 mb-4">Get Matches</h3>
                        <p class="text-gray-600">Our AI analyzes your profile and finds the best internship opportunities</p>
                    </div>
                    <div class="text-center">
                        <div class="w-20 h-20 bg-green-600 text-white rounded-full flex items-center justify-center text-3xl font-bold mx-auto mb-6">3</div>
                        <h3 class="text-2xl font-bold text-gray-900 mb-4">Apply & Succeed</h3>
                        <p class="text-gray-600">Apply directly to your matched positions and land your dream internship</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="py-20 bg-gradient-to-r from-blue-600 to-purple-600">
        <div class="container mx-auto px-6 text-center">
            <h2 class="text-4xl font-bold text-white mb-6">Ready to Find Your Perfect Internship?</h2>
            <p class="text-xl text-blue-100 mb-8 max-w-2xl mx-auto">Join thousands of students who have already found their dream opportunities</p>
            <a href="register.jsp" class="inline-block px-8 py-4 bg-white text-blue-600 rounded-lg text-lg font-semibold hover:bg-gray-100 transition transform hover:scale-105 shadow-xl">
                Get Started Free
                <i class="fas fa-arrow-right ml-2"></i>
            </a>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-gray-900 text-gray-300 py-12">
        <div class="container mx-auto px-6">
            <div class="grid md:grid-cols-4 gap-8">
                <div>
                    <div class="flex items-center space-x-2 mb-4">
                        <i class="fas fa-brain text-blue-500 text-2xl"></i>
                        <span class="text-xl font-bold text-white">AI Internship Portal</span>
                    </div>
                    <p class="text-gray-400">Connecting talented students with amazing opportunities.</p>
                </div>
                <div>
                    <h4 class="text-white font-semibold mb-4">Quick Links</h4>
                    <ul class="space-y-2">
                        <li><a href="#" class="hover:text-blue-400 transition">About Us</a></li>
                        <li><a href="#" class="hover:text-blue-400 transition">Contact</a></li>
                        <li><a href="#" class="hover:text-blue-400 transition">Blog</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="text-white font-semibold mb-4">Resources</h4>
                    <ul class="space-y-2">
                        <li><a href="#" class="hover:text-blue-400 transition">Help Center</a></li>
                        <li><a href="#" class="hover:text-blue-400 transition">Privacy Policy</a></li>
                        <li><a href="#" class="hover:text-blue-400 transition">Terms of Service</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="text-white font-semibold mb-4">Connect</h4>
                    <div class="flex space-x-4">
                        <a href="#" class="text-gray-400 hover:text-blue-400 transition"><i class="fab fa-twitter text-2xl"></i></a>
                        <a href="#" class="text-gray-400 hover:text-blue-400 transition"><i class="fab fa-linkedin text-2xl"></i></a>
                        <a href="#" class="text-gray-400 hover:text-blue-400 transition"><i class="fab fa-github text-2xl"></i></a>
                    </div>
                </div>
            </div>
            <div class="border-t border-gray-800 mt-8 pt-8 text-center text-gray-500">
                <p>&copy; 2025 AI Internship Portal. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script>
        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }
            });
        });
    </script>
</body>
</html>