<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.UserProfile" %>
<%
    UserProfile user = (UserProfile) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Recommendations - Internship Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-50">
    <!-- Navigation -->
    <nav class="bg-white shadow-md">
        <div class="container mx-auto px-6 py-4">
            <div class="flex items-center justify-between">
                <div class="flex items-center space-x-4">
                    <i class="fas fa-brain text-blue-600 text-2xl"></i>
                    <span class="text-xl font-bold text-gray-800">AI Internship Portal</span>
                </div>
                
                <div class="hidden md:flex space-x-6">
                    <a href="home.jsp" class="text-gray-600 hover:text-blue-600 transition">Dashboard</a>
                    <a href="recommendations.jsp" class="text-blue-600 font-semibold">Recommendations</a>
                    <a href="profile.jsp" class="text-gray-600 hover:text-blue-600 transition">My Profile</a>
                    <a href="applications.jsp" class="text-gray-600 hover:text-blue-600 transition">Applications</a>
                </div>

                <div class="flex items-center space-x-4">
                    <button class="relative">
                        <i class="fas fa-bell text-gray-600 text-xl"></i>
                        <span class="absolute -top-1 -right-1 bg-red-500 text-white text-xs rounded-full w-4 h-4 flex items-center justify-center">3</span>
                    </button>
                    <div class="relative group">
                        <button class="flex items-center space-x-2">
                            <img src="https://ui-avatars.com/api/?name=<%= user.getName() %>&background=4F46E5&color=fff" class="w-10 h-10 rounded-full">
                            <i class="fas fa-chevron-down text-gray-600"></i>
                        </button>
                        <div class="absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg py-2 hidden group-hover:block z-50">
                            <a href="profile.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">
                                <i class="fas fa-user mr-2"></i>My Profile
                            </a>
                            <a href="settings.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">
                                <i class="fas fa-cog mr-2"></i>Settings
                            </a>
                            <hr class="my-2">
                            <a href="LogoutServlet" class="block px-4 py-2 text-red-600 hover:bg-gray-100">
                                <i class="fas fa-sign-out-alt mr-2"></i>Logout
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mx-auto px-6 py-8">
        <!-- Header -->
        <div class="mb-8">
            <h1 class="text-3xl font-bold text-gray-900 mb-2">
                <i class="fas fa-magic text-purple-600 mr-2"></i>AI-Powered Recommendations
            </h1>
            <p class="text-gray-600">Personalized internship opportunities based on your profile</p>
        </div>

        <!-- Filters & Search -->
        <div class="bg-white rounded-xl shadow-md p-6 mb-8">
            <div class="grid md:grid-cols-5 gap-4">
                <div class="md:col-span-2">
                    <div class="relative">
                        <i class="fas fa-search absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                        <input 
                            type="text" 
                            id="searchInput"
                            placeholder="Search internships..." 
                            class="w-full pl-12 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        >
                    </div>
                </div>
                <div>
                    <select id="locationFilter" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        <option value="">All Locations</option>
                        <option value="remote">Remote</option>
                        <option value="onsite">On-site</option>
                        <option value="hybrid">Hybrid</option>
                    </select>
                </div>
                <div>
                    <select id="categoryFilter" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        <option value="">All Categories</option>
                        <option value="engineering">Engineering</option>
                        <option value="data">Data Science</option>
                        <option value="design">Design</option>
                        <option value="business">Business</option>
                    </select>
                </div>
                <div>
                    <button onclick="applyFilters()" class="w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700 transition">
                        <i class="fas fa-filter mr-2"></i>Apply Filters
                    </button>
                </div>
            </div>
            
            <!-- Active Filters -->
            <div id="activeFilters" class="mt-4 flex flex-wrap gap-2 hidden">
                <span class="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm flex items-center">
                    Remote <i class="fas fa-times ml-2 cursor-pointer"></i>
                </span>
            </div>
        </div>

        <!-- Match Score Info -->
        <div class="bg-gradient-to-r from-blue-500 to-purple-600 rounded-xl shadow-md p-6 mb-8 text-white">
            <div class="flex items-center justify-between">
                <div class="flex items-center space-x-4">
                    <div class="bg-white bg-opacity-20 rounded-full p-4">
                        <i class="fas fa-robot text-3xl"></i>
                    </div>
                    <div>
                        <h3 class="text-xl font-bold mb-1">Your AI Match Score: <%= user != null ? "87%" : "N/A" %></h3>
                        <p class="text-blue-100">Based on: <%= user != null ? user.getSkills() : "Your skills and preferences" %></p>
                    </div>
                </div>
                <button class="bg-white text-blue-600 px-6 py-2 rounded-lg font-semibold hover:bg-blue-50 transition">
                    Update Profile
                </button>
            </div>
        </div>

        <!-- Recommendations Grid -->
        <div id="recommendationsGrid" class="grid md:grid-cols-2 gap-6">
            <!-- Recommendation Card 1 -->
            <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition overflow-hidden">
                <div class="p-6">
                    <div class="flex items-start justify-between mb-4">
                        <div class="flex items-start space-x-3">
                            <img src="https://logo.clearbit.com/google.com" class="w-16 h-16 rounded-lg border border-gray-200" onerror="this.src='https://ui-avatars.com/api/?name=Google&background=4285F4&color=fff'">
                            <div>
                                <h3 class="text-xl font-bold text-gray-900 mb-1">Software Engineering Intern</h3>
                                <p class="text-gray-600">Google</p>
                            </div>
                        </div>
                        <button class="text-gray-400 hover:text-red-500 transition">
                            <i class="far fa-heart text-xl"></i>
                        </button>
                    </div>

                    <div class="flex items-center gap-4 mb-4 text-sm text-gray-600">
                        <span><i class="fas fa-map-marker-alt mr-1 text-blue-600"></i>Mountain View, CA</span>
                        <span><i class="fas fa-briefcase mr-1 text-purple-600"></i>Full-time</span>
                        <span><i class="fas fa-calendar mr-1 text-green-600"></i>Summer 2025</span>
                    </div>

                    <p class="text-gray-600 mb-4 line-clamp-3">
                        Join our engineering team to build innovative features that impact billions of users. Work on cutting-edge projects in cloud computing, AI/ML, and distributed systems.
                    </p>

                    <div class="flex flex-wrap gap-2 mb-4">
                        <span class="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm font-semibold">Python</span>
                        <span class="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm font-semibold">Java</span>
                        <span class="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm font-semibold">C++</span>
                        <span class="bg-purple-100 text-purple-700 px-3 py-1 rounded-full text-sm font-semibold">ML</span>
                    </div>

                    <div class="flex items-center justify-between pt-4 border-t border-gray-200">
                        <div class="flex items-center">
                            <div class="flex items-center mr-4">
                                <div class="w-12 h-12 rounded-full bg-gradient-to-br from-green-400 to-green-600 flex items-center justify-center text-white font-bold text-lg">
                                    95
                                </div>
                                <span class="ml-2 text-sm text-gray-600 font-semibold">Match</span>
                            </div>
                        </div>
                        <div class="flex gap-2">
                            <button class="px-4 py-2 border border-blue-600 text-blue-600 rounded-lg hover:bg-blue-50 transition font-semibold">
                                <i class="fas fa-info-circle mr-1"></i>Details
                            </button>
                            <button class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition font-semibold">
                                <i class="fas fa-paper-plane mr-1"></i>Apply
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recommendation Card 2 -->
            <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition overflow-hidden">
                <div class="p-6">
                    <div class="flex items-start justify-between mb-4">
                        <div class="flex items-start space-x-3">
                            <img src="https://logo.clearbit.com/microsoft.com" class="w-16 h-16 rounded-lg border border-gray-200" onerror="this.src='https://ui-avatars.com/api/?name=Microsoft&background=00A4EF&color=fff'">
                            <div>
                                <h3 class="text-xl font-bold text-gray-900 mb-1">AI Research Intern</h3>
                                <p class="text-gray-600">Microsoft</p>
                            </div>
                        </div>
                        <button class="text-gray-400 hover:text-red-500 transition">
                            <i class="far fa-heart text-xl"></i>
                        </button>
                    </div>

                    <div class="flex items-center gap-4 mb-4 text-sm text-gray-600">
                        <span><i class="fas fa-map-marker-alt mr-1 text-blue-600"></i>Redmond, WA</span>
                        <span><i class="fas fa-briefcase mr-1 text-purple-600"></i>Full-time</span>
                        <span><i class="fas fa-calendar mr-1 text-green-600"></i>Summer 2025</span>
                    </div>

                    <p class="text-gray-600 mb-4 line-clamp-3">
                        Work alongside world-class researchers on cutting-edge AI projects. Focus areas include NLP, computer vision, and reinforcement learning. Publish papers and contribute to open source.
                    </p>

                    <div class="flex flex-wrap gap-2 mb-4">
                        <span class="bg-purple-100 text-purple-700 px-3 py-1 rounded-full text-sm font-semibold">PyTorch</span>
                        <span class="bg-purple-100 text-purple-700 px-3 py-1 rounded-full text-sm font-semibold">TensorFlow</span>
                        <span class="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm font-semibold">Python</span>
                        <span class="bg-pink-100 text-pink-700 px-3 py-1 rounded-full text-sm font-semibold">Research</span>
                    </div>

                    <div class="flex items-center justify-between pt-4 border-t border-gray-200">
                        <div class="flex items-center">
                            <div class="flex items-center mr-4">
                                <div class="w-12 h-12 rounded-full bg-gradient-to-br from-green-400 to-green-600 flex items-center justify-center text-white font-bold text-lg">
                                    92
                                </div>
                                <span class="ml-2 text-sm text-gray-600 font-semibold">Match</span>
                            </div>
                        </div>
                        <div class="flex gap-2">
                            <button class="px-4 py-2 border border-blue-600 text-blue-600 rounded-lg hover:bg-blue-50 transition font-semibold">
                                <i class="fas fa-info-circle mr-1"></i>Details
                            </button>
                            <button class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition font-semibold">
                                <i class="fas fa-paper-plane mr-1"></i>Apply
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recommendation Card 3 -->
            <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition overflow-hidden">
                <div class="p-6">
                    <div class="flex items-start justify-between mb-4">
                        <div class="flex items-start space-x-3">
                            <img src="https://logo.clearbit.com/amazon.com" class="w-16 h-16 rounded-lg border border-gray-200" onerror="this.src='https://ui-avatars.com/api/?name=Amazon&background=FF9900&color=fff'">
                            <div>
                                <h3 class="text-xl font-bold text-gray-900 mb-1">Data Science Intern</h3>
                                <p class="text-gray-600">Amazon</p>
                            </div>
                        </div>
                        <button class="text-red-500 transition">
                            <i class="fas fa-heart text-xl"></i>
                        </button>
                    </div>

                    <div class="flex items-center gap-4 mb-4 text-sm text-gray-600">
                        <span><i class="fas fa-map-marker-alt mr-1 text-blue-600"></i>Seattle, WA</span>
                        <span><i class="fas fa-briefcase mr-1 text-purple-600"></i>Full-time</span>
                        <span><i class="fas fa-calendar mr-1 text-green-600"></i>Summer 2025</span>
                    </div>

                    <p class="text-gray-600 mb-4 line-clamp-3">
                        Analyze massive datasets to drive business decisions. Build ML models for recommendation systems, demand forecasting, and customer insights. Work with AWS technologies.
                    </p>

                    <div class="flex flex-wrap gap-2 mb-4">
                        <span class="bg-green-100 text-green-700 px-3 py-1 rounded-full text-sm font-semibold">Python</span>
                        <span class="bg-green-100 text-green-700 px-3 py-1 rounded-full text-sm font-semibold">SQL</span>
                        <span class="bg-orange-100 text-orange-700 px-3 py-1 rounded-full text-sm font-semibold">AWS</span>
                        <span class="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm font-semibold">Statistics</span>
                    </div>

                    <div class="flex items-center justify-between pt-4 border-t border-gray-200">
                        <div class="flex items-center">
                            <div class="flex items-center mr-4">
                                <div class="w-12 h-12 rounded-full bg-gradient-to-br from-yellow-400 to-orange-500 flex items-center justify-center text-white font-bold text-lg">
                                    88
                                </div>
                                <span class="ml-2 text-sm text-gray-600 font-semibold">Match</span>
                            </div>
                        </div>
                        <div class="flex gap-2">
                            <button class="px-4 py-2 border border-blue-600 text-blue-600 rounded-lg hover:bg-blue-50 transition font-semibold">
                                <i class="fas fa-info-circle mr-1"></i>Details
                            </button>
                            <button class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition font-semibold">
                                <i class="fas fa-paper-plane mr-1"></i>Apply
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recommendation Card 4 -->
            <div class="bg-white rounded-xl shadow-md hover:shadow-xl transition overflow-hidden">
                <div class="p-6">
                    <div class="flex items-start justify-between mb-4">
                        <div class="flex items-start space-x-3">
                            <img src="https://logo.clearbit.com/meta.com" class="w-16 h-16 rounded-lg border border-gray-200" onerror="this.src='https://ui-avatars.com/api/?name=Meta&background=0668E1&color=fff'">
                            <div>
                                <h3 class="text-xl font-bold text-gray-900 mb-1">Product Design Intern</h3>
                                <p class="text-gray-600">Meta</p>
                            </div>
                        </div>
                        <button class="text-gray-400 hover:text-red-500 transition">
                            <i class="far fa-heart text-xl"></i>
                        </button>
                    </div>

                    <div class="flex items-center gap-4 mb-4 text-sm text-gray-600">
                        <span><i class="fas fa-map-marker-alt mr-1 text-blue-600"></i>Menlo Park, CA</span>
                        <span><i class="fas fa-briefcase mr-1 text-purple-600"></i>Full-time</span>
                        <span><i class="fas fa-calendar mr-1 text-green-600"></i>Summer 2025</span>
                    </div>

                    <p class="text-gray-600 mb-4 line-clamp-3">
                        Design innovative user experiences for billions of people. Work on Facebook, Instagram, or WhatsApp products. Collaborate with engineers and PMs to ship impactful features.
                    </p>

                    <div class="flex flex-wrap gap-2 mb-4">
                        <span class="bg-pink-100 text-pink-700 px-3 py-1 rounded-full text-sm font-semibold">Figma</span>
                        <span class="bg-purple-100 text-purple-700 px-3 py-1 rounded-full text-sm font-semibold">UI/UX</span>
                        <span class="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm font-semibold">Prototyping</span>
                    </div>

                    <div class="flex items-center justify-between pt-4 border-t border-gray-200">
                        <div class="flex items-center">
                            <div class="flex items-center mr-4">
                                <div class="w-12 h-12 rounded-full bg-gradient-to-br from-yellow-400 to-orange-500 flex items-center justify-center text-white font-bold text-lg">
                                    85
                                </div>
                                <span class="ml-2 text-sm text-gray-600 font-semibold">Match</span>
                            </div>
                        </div>
                        <div class="flex gap-2">
                            <button class="px-4 py-2 border border-blue-600 text-blue-600 rounded-lg hover:bg-blue-50 transition font-semibold">
                                <i class="fas fa-info-circle mr-1"></i>Details
                            </button>
                            <button class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition font-semibold">
                                <i class="fas fa-paper-plane mr-1"></i>Apply
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Load More -->
        <div class="text-center mt-8">
            <button class="px-8 py-3 bg-white border-2 border-blue-600 text-blue-600 rounded-lg font-semibold hover:bg-blue-50 transition">
                <i class="fas fa-sync-alt mr-2"></i>Load More Recommendations
            </button>
        </div>
    </div>

    <script>
        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const cards = document.querySelectorAll('#recommendationsGrid > div');
            
            cards.forEach(card => {
                const text = card.textContent.toLowerCase();
                card.style.display = text.includes(searchTerm) ? 'block' : 'none';
            });
        });

        // Apply filters
        function applyFilters() {
            const location = document.getElementById('locationFilter').value;
            const category = document.getElementById('categoryFilter').value;
            
            // Show active filters
            if (location || category) {
                document.getElementById('activeFilters').classList.remove('hidden');
            }
            
            // Filter logic here
            console.log('Applying filters:', { location, category });
        }

        // Favorite toggle
        document.querySelectorAll('.far.fa-heart, .fas.fa-heart').forEach(icon => {
            icon.parentElement.addEventListener('click', function(e) {
                e.preventDefault();
                icon.classList.toggle('far');
                icon.classList.toggle('fas');
            });
        });
    </script>
</body>
</html>