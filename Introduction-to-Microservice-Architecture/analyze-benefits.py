#!/usr/bin/env python3

class MicroserviceBenefitAnalyzer:
    def __init__(self):
        self.benefits = {
            'scalability': {
                'description': 'Independent scaling of services',
                'example': 'Scale payment service during high transaction periods',
                'impact': 'High'
            },
            'technology_diversity': {
                'description': 'Use different technologies per service',
                'example': 'Python for ML service, Go for high-performance API',
                'impact': 'Medium'
            },
            'fault_isolation': {
                'description': 'Failures contained to individual services',
                'example': 'Recommendation service down, checkout still works',
                'impact': 'High'
            },
            'team_autonomy': {
                'description': 'Teams can work independently',
                'example': 'User team deploys without affecting product team',
                'impact': 'High'
            }
        }

    def analyze_benefit(self, benefit_name):
        if benefit_name in self.benefits:
            benefit = self.benefits[benefit_name]
            print(f"Benefit: {benefit_name.title()}")
            print(f"Description: {benefit['description']}")
            print(f"Example: {benefit['example']}")
            print(f"Business Impact: {benefit['impact']}")
            print("-" * 50)
        else:
            print(f"Benefit '{benefit_name}' not found")

    def analyze_all_benefits(self):
        print("MICROSERVICE BENEFITS ANALYSIS")
        print("=" * 50)
        for benefit_name in self.benefits:
            self.analyze_benefit(benefit_name)

if __name__ == "__main__":
    analyzer = MicroserviceBenefitAnalyzer()
    analyzer.analyze_all_benefits()
