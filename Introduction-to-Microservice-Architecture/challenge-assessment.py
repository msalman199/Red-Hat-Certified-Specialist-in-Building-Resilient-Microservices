#!/usr/bin/env python3

class ChallengeAssessment:
    def __init__(self):
        self.challenges = {
            'network_complexity': {
                'severity': 'High',
                'description': 'Network calls can fail and have latency',
                'mitigation': 'Circuit breakers, retries, timeouts',
                'tools': 'Istio, Envoy'
            },
            'data_consistency': {
                'severity': 'High',
                'description': 'Maintaining consistency across services',
                'mitigation': 'Eventual consistency, Saga pattern',
                'tools': 'Event sourcing, CQRS'
            },
            'service_discovery': {
                'severity': 'Medium',
                'description': 'Services need to find each other dynamically',
                'mitigation': 'Service registry, DNS-based discovery',
                'tools': 'Consul, Kubernetes DNS'
            },
            'monitoring_complexity': {
                'severity': 'Medium',
                'description': 'Tracking requests across many services',
                'mitigation': 'Distributed tracing, centralized logging',
                'tools': 'Jaeger, ELK stack'
            }
        }

    def assess_challenge(self, challenge_name):
        if challenge_name in self.challenges:
            challenge = self.challenges[challenge_name]
            print(f"Challenge: {challenge_name.replace('_', ' ').title()}")
            print(f"Severity: {challenge['severity']}")
            print(f"Description: {challenge['description']}")
            print(f"Mitigation: {challenge['mitigation']}")
            print(f"Tools: {challenge['tools']}")
            print("-" * 60)

    def assess_all_challenges(self):
        print("MICROSERVICE CHALLENGES ASSESSMENT")
        print("=" * 60)
        for challenge_name in self.challenges:
            self.assess_challenge(challenge_name)

if __name__ == "__main__":
    assessor = ChallengeAssessment()
    assessor.assess_all_challenges()
