import { HttpClient } from '@angular/common/http';
import { Component, OnInit, inject, signal } from '@angular/core';

type BackendStatus = 'checking' | 'up' | 'down';

@Component({
  selector: 'app-root',
  templateUrl: './app.html',
  styleUrl: './app.scss',
})
export class App implements OnInit {
  private readonly http = inject(HttpClient);

  protected readonly title = signal('Tiko');
  protected readonly backend = signal<BackendStatus>('checking');

  ngOnInit(): void {
    this.http.get<{ status: string }>('/api/ping').subscribe({
      next: () => this.backend.set('up'),
      error: () => this.backend.set('down'),
    });
  }
}
