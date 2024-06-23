# filters.rb

# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
# filters.rb

# Helper method: Checks if a candidate is experienced (>= 2 years of experience)
def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

# Helper method: Checks if a candidate has 100 or more GitHub points
def github_points?(candidate)
  candidate[:github_points] >= 100
end

# Helper method: Checks if a candidate knows Ruby or Python
def knows_ruby_or_python?(candidate)
  candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
end

# Helper method: Checks if a candidate applied in the last 15 days
def applied_recently?(candidate)
  candidate[:date_applied] >= Date.today - 15
end

# Helper method: Checks if a candidate is over the age of 17
def over_17?(candidate)
  candidate[:age] > 17
end

# Method to filter qualified candidates based on multiple criteria
def qualified_candidates(candidates)
  candidates.select do |candidate|
    experienced?(candidate) &&
      github_points?(candidate) &&
      knows_ruby_or_python?(candidate) &&
      applied_recently?(candidate) &&
      over_17?(candidate)
  end
end

# Method to sort candidates by qualifications (experience and GitHub points)
def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end

# More methods will go below
