<?php

namespace App\Controller\Admin;

use App\Entity\Adherent;
use App\Entity\Admin;
use App\Entity\Genre;
use App\Entity\Usure;
use App\Entity\Auteur;
use App\Entity\Editeur;
use App\Entity\Emprunt;
use App\Entity\Exemplaire;
use App\Entity\Livre;
use App\Entity\Stock;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;

class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        //return parent::index();

        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
        // $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        // return $this->redirect($adminUrlGenerator->setController(OneOfYourCrudController::class)->generateUrl());

        // Option 2. You can make your dashboard redirect to different pages depending on the user
        //
        // if ('jane' === $this->getUser()->getUsername()) {
        //     return $this->redirect('...');
        // }

        // Option 3. You can render some custom template to display a proper dashboard with widgets, etc.
        // (tip: it's easier if your template extends from @EasyAdmin/page/content.html.twig)
        //
        // return $this->render('some/path/my-dashboard.html.twig');
        
        return $this->render('admin/dashboard.html.twig');

    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Symfony Yourbook');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-house');
        yield MenuItem::linkToCrud('Genre', 'fa fa-tags', Genre::class);
        yield MenuItem::linkToCrud('Editeur', 'fas fa-list', Editeur::class);
        yield MenuItem::linkToCrud('Auteur', 'fa fa-users', Auteur::class);
        yield MenuItem::linkToCrud('Usure', 'fas fa-list', Usure::class);
        yield MenuItem::linkToCrud('Stock', 'fas fa-list', Stock::class);
        yield MenuItem::linkToCrud('Livre', 'fa fa-book', Livre::class);
        yield MenuItem::linkToCrud('Exemplaire', 'fa fa-book', Exemplaire::class);
        yield MenuItem::linkToCrud('Emprunt', 'fa fa-book', Emprunt::class);
        yield MenuItem::linkToCrud('Adherent', 'fa fa-book', Adherent::class);
        yield MenuItem::linkToCrud('Admin', 'fa fa-users', Admin::class);
    }
    
}
