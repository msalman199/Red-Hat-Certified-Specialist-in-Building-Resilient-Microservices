#!/usr/bin/env python3

class MicroserviceDecisionMatrix:
    def __init__(self):
        self.factors = {
            'team_size': {
                'small': {'monolith': 8, 'microservice': 3},
                'medium': {'monolith': 6, 'microservice': 6},
                'large': {'monolith': 3, 'microservice': 9}
            },
            'system_complexity': {
                'low': {'monolith': 9, 'microservice': 4},
                'medium': {'monolith': 6, 'microservice': 6},
                'high': {'monolith': 3, 'microservice': 8}
            },
            'scalability_requirements': {
                'low': {'monolith': 8, 'microservice': 5},
                'medium': {'monolith': 5, 'microservice': 7},
                'high': {'monolith': 2, 'microservice': 9}
            },
            'deployment_frequency': {
                'low': {'monolith': 7, 'microservice': 4},
                'medium': {'monolith': 5, 'microservice': 6},
                'high': {'monolith': 3, 'microservice': 9}
            }
        }

    def evaluate_scenario(self, team_size, complexity, scalability, deployment):
        monolith_score = 0
        microservice_score = 0

        factors = [
            ('team_size', team_size),
            ('system_complexity', complexity),
            ('scalability_requirements', scalability),
            ('deployment_frequency', deployment)
        ]

        print("DECISION MATRIX EVALUATION")
        print("=" * 40)

        for factor_name, factor_value in factors:
            factor_scores = self.factors[factor_name][factor_value]
            monolith_score += factor_scores['monolith']
            microservice_score += factor_scores['microservice']

            print(f"{factor_name.replace('_', ' ').title()}: {factor_value}")
            print(f"  Monolith: {factor_scores['monolith']}")
            print(f"  Microservice: {factor_scores['microservice']}")

        print("-" * 40)
        print(f"Total Monolith Score: {monolith_score}")
        print(f"Total Microservice Score: {microservice_score}")

        if monolith_score > microservice_score:
            recommendation = "Monolithic Architecture"
        elif microservice_score > monolith_score:
            recommendation = "Microservice Architecture"
        else:
            recommendation = "Either approach viable"

        print(f"Recommendation: {recommendation}")
        return recommendation

if __name__ == "__main__":
    matrix = MicroserviceDecisionMatrix()

    print("Scenario 1: Startup with simple application")
    matrix.evaluate_scenario('small', 'low', 'low', 'medium')

    print("\n" + "=" * 50 + "\n")

    print("Scenario 2: Large enterprise with complex requirements")
    matrix.evaluate_scenario('large', 'high', 'high', 'high')
